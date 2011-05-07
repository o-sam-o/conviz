class DataController < ApplicationController

  def boats
    @boats = query_to_map("select boat, count(*) as convicts, count(distinct(departure_date)) as voyage_count from convicts group by boat order by boat")
  end

  def destinations
    @destinations = query_to_map("select destination, count(*) as convicts from convicts group by destination order by destination")
  end

  def years
    @years = query_to_map("select departure_year, count(*) as convicts from convicts where departure_year is not null group by departure_year order by departure_year")
  end

private

  def query_to_map(query)
    ActiveRecord::Base.connection.execute(query).collect { |m| m.with_indifferent_access }
  end

end
