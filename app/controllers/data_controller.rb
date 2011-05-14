class DataController < ApplicationController

  def boats
    @boats = query_to_map("select boat, count(*) as convicts, count(distinct(departure_date)) as voyage_count from convicts group by boat order by boat")
    @top_boats = query_to_map("select boat, count(*) as convicts from convicts group by boat order by count(*) desc limit 100")
  end

  def destinations
    @destinations = query_to_map("select destination, count(*) as convicts from convicts group by destination order by destination")
  end

  def departure_dates
    @years = query_to_map("select departure_year, count(*) as convicts from convicts where departure_year is not null group by departure_year order by departure_year")
    @years_map = @years.inject({}) do |result, map| 
      result[map[:departure_year]] = map[:convicts]
      result
    end
    @months = query_to_map("select departure_month,  count(*) as convicts from convicts where departure_month is not null group by departure_month order by departure_month")

    @decades = {}
    start_year = 1780
    until start_year == 1870
      end_year = start_year + 10
      @decades["#{start_year}-#{end_year}"] = ActiveRecord::Base.connection.execute("select count(*) as convicts from convicts where departure_year >= #{start_year} and departure_year < #{end_year}").first['convicts']
      start_year = end_year
    end
  end

  def court_counties
    @counties = query_to_map("select court_county, count(*) as convicts from convicts where court_county is not null group by court_county order by court_county")
  end

private

  def query_to_map(query)
    ActiveRecord::Base.connection.execute(query).collect { |m| m.with_indifferent_access }
  end

end
