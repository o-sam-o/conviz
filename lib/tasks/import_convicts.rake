desc 'inserts convicts into database'
task :insert_convicts => :environment do
  File.open("#{Rails.root}/lib/Convict_records.txt", "r") do |infile|
    while (line = infile.gets)
      puts line
      values = line.split("\t").collect { |v| v.gsub('"', '') }

      values.each_with_index { |v, index| p "[#{index}] #{v}" }

      p '*' * 20

      court_and_term = values[1]
      if court_and_term =~ /Convicted at (.*) for a term/
        court = $1
      end

      if court_and_term =~ /for a term of (.*)/
        term = $1.gsub(/.\s*$/, '')
        term = term.gsub(/ on .*/, '')
      end

      departure_date = Date.parse(values[3]) rescue nil

      data = {
        name: values[7],
        description: values[0],
        boat: values[2],
        departure_date: departure_date,
        departure_year: departure_date.try(:year),
        departure_month: departure_date.try(:month),
        destination: values[4],
        court_and_term: court_and_term,
        court: court,
        court_county: county_finder(court),
        term: term,
        source: values[5],
      }
      data.each do |d|
        p "#{d[0]}: #{d[1]}"
      end

      Convict.create!(data)
      # Faster insert?
      # db.execute "insert into convicts (#{data.keys.join(', ')}) values (#{'?, ' * (data.length - 1)} ?)", data.values
    end
  end

  p "Done."
end

def county_finder(court)
 County.all.each do |county|
   return county.name if court =~ /#{county.name}/i
 end
 County.where('alias is not null').each do |county|
   return county.name if court =~ /#{county.alias}/i
 end
 return nil
end
