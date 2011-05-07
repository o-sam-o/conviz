require 'sqlite3'

`rm convicts.db` if File.exists?('convicts.db')
db = SQLite3::Database.new "convicts.db"

=begin
Name of convict, including any known aliases
Place of trial
Term of years
Name of ship and date of departure
Place of arrival
=end

db.execute <<-SQL
    create table convicts (
      id INTEGER PRIMARY KEY ASC,
      name varchar(1024),
      description varchar(1024),
      boat varchar(1024),
      departure_date varchar(1024),
      destination varchar(1024),
      court_and_term varchar(1024),
      court varchar(1024),
      term varchar(1024),
      source varchar(1024)
    );
SQL

File.open("Convict_records.txt", "r") do |infile|
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

    data = {
      name: values[7],
      description: values[0],
      boat: values[2],
      departure_date: values[3],
      destination: values[4],
      court_and_term: court_and_term,
      court: court,
      term: term,
      source: values[5],
    }
    data.each do |d|
      p "#{d[0]}: #{d[1]}"
    end

    db.execute "insert into convicts (#{data.keys.join(', ')}) values (#{'?, ' * (data.length - 1)} ?)", data.values
	end
end

p "Done."

