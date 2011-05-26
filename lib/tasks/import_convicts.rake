desc 'inserts convicts into database'
task :insert_convicts => :environment do
  Convict.delete_all
  # Download convict records from : http://data.gov.au/dataset/british-convict-transportation-registers/
  File.open("#{Rails.root}/lib/Convict_records.txt", "r") do |infile|
    while (line = infile.gets)
      puts line
      values = line.split("\t").collect { |v| v.gsub('"', '') }

      values.each_with_index { |v, index| p "[#{index}] #{v}" }

      p '*' * 20

      full_name = values[7]
      next if full_name.blank?
      first_name = full_name.split(',')[0].strip
      last_name = full_name.split(',')[1..-1].join(',').strip if full_name.split(',').length > 1

      alias_name = values[8]
      alias_name = alias_name.gsub(/\(alias\)/i, '').strip if alias_name
      # TODO values[9] can also contain an alias name

      court_and_term = values[1]
      if court_and_term =~ /Convicted at (.*) for a term/
        court = $1
      end

      if court_and_term =~ /for a term of (.*)/
        term = $1
        term = 'Life' if term =~ /life/
        term = $1 if term =~ /(\d+) year/
        # Handle 2 specific corner cases
        term = '7' if term =~ /seven years/
      end

      departure_date = Date.parse(values[3]) rescue nil

      destination = values[4]

      data = {
        name: full_name,
        first_name: first_name,
        last_name: last_name,
        alias_name: alias_name,
        description: values[0],
        boat: clean_boat(values[2]),
        departure_date: departure_date,
        departure_year: departure_date.try(:year),
        departure_month: departure_date.try(:month),
        raw_destination: destination,
        destination: clean_destination(destination),
        destination_state: destination_state(clean_destination(destination)),
        court_and_term: court_and_term,
        court: court,
        court_county: county_finder(court),
        term: term,
        source: values[5],
        copyright: values[6]
      }
      data.each do |d|
        p "#{d[0]}: #{d[1]}"
      end

      Convict.create!(data)
    end
  end

  p "Done."
end

def county_finder(court)
  @all_countries ||= County.all
  @all_countries.each do |county|
    return county.name if court =~ /#{county.name}/i
  end
  @aliased_countries ||= County.where('alias is not null').collect { |c| c }
  @aliased_countries.each do |county|
    county.alias.split(';').each do |c_alias|
      return county.name if court =~ /#{c_alias}/i
    end
  end
  return nil
end

def clean_destination(destination)
  case destination
  when /Norfolk Island/i then "Norfolk Island"
  when /Port Phillip/i then "Port Phillip"
  when /Maria Island/i then "Maria Island"
  when /New South Wales/i then "New South Wales"
  when /Van Diemens Land/i then "Van Diemen's Land"
  when /Van Diemen's Land/i then "Van Diemen's Land"
  when /Gibraltar/i then "Gibraltar"
  when /Moreton Bay/i then "Moreton Bay"
  when /Western Australia/i then "Western Australia"
  else nil
  end
end

def destination_state(destination)
  @dest_map ||= Destination.all.inject({}) { |result, destination| result[destination.name] = destination; result }
  @dest_map[destination].try(:state)
end

def clean_boat(boat)
  case boat
  when  /Lady Palmira/ then 'Lady Palmira'
  when  /Lord Lynedoch/ then 'Lord Lynedoch'
  when  /Barossa/ then 'Barrosa'
  when  /Bussorah Marchant/ then 'Bussorah Merchant'
  when  /Earl Gray/ then 'Earl Grey'
  when  /Guilford/ then 'Guildford'
  when  /Mount Stuart Elphinstone/ then 'Mount Stuart Elphinstone'
  when  /Lady Palmira.[Palmyra]/ then 'Lady Palmira [Palmyra]'
  when  /^Departure:/ then nil
  else boat
  end
end
