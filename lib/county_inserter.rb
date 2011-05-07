require 'geokit'
require 'sqlite3'
require './uk_county_names'

db = SQLite3::Database.new "convicts.db"
db.execute "delete from counties"

include Geokit::Geocoders

UK_COUNTY_NAMES.each do |county|
  p county
  geo_result = MultiGeocoder.geocode("#{county}, UK")
  db.execute "insert into counties (name, latitude, longitude) values (?, ?, ?)", county, geo_result.lat.to_s, geo_result.lng.to_s
end
