class Convict < ActiveRecord::Base

  def self.boat_stats
    query_to_map("select boat, count(*) as convicts, count(distinct(departure_date)) as voyage_count from convicts where boat is not null group by boat order by boat")
  end

  def self.top_boat_stats
    query_to_map("select boat, count(*) as convicts from convicts group by boat order by count(*) desc limit 100")
  end

  def self.destination_stats
    query_to_map("select destination, destinations.state, count(*) as convicts from convicts left join destinations on destinations.name = convicts.destination where destination is not null group by destination, destinations.state order by destination")
  end

  def self.aust_destination_stats
    self.destination_stats.inject({}) do |result, value|
      destination = Destination.find_by_name(value[:destination])
      result["#{destination.current_name}"] = value[:convicts] unless destination.blank?
      result
    end
  end

  def self.state_destination_stats
    query_to_map("select destinations.state, count(*) as convicts from convicts inner join destinations on destinations.name = convicts.destination group by destinations.state order by destinations.state")
  end

  def self.year_stats
    year_stats = query_to_map("select departure_year, count(*) as convicts from convicts where departure_year is not null group by departure_year order by departure_year")
    year_stats_map = year_stats.inject({}) do |result, map| 
      result[map[:departure_year]] = map[:convicts]
      result
    end
    return year_stats, year_stats_map
  end

  def self.month_stats
    query_to_map("select departure_month,  count(*) as convicts from convicts where departure_month is not null group by departure_month order by departure_month")
  end

  def self.decade_stats
    decades = {}
    start_year = 1780
    until start_year == 1870
      end_year = start_year + 10
      decades["#{start_year}-#{end_year}"] = ActiveRecord::Base.connection.execute("select count(*) as convicts from convicts where departure_year >= #{start_year} and departure_year < #{end_year}").first['convicts']
      start_year = end_year
    end
    return decades
  end

  def self.court_county_stats
    query_to_map("select court_county, count(*) as convicts from convicts where court_county is not null group by court_county order by court_county")
  end

  def self.top_county_stats
    query_to_map('select court_county, count(*) as convicts from convicts where court_county is not null group by court_county order by count(*) desc limit 15')
  end

private

  def self.query_to_map(query)
    ActiveRecord::Base.connection.execute(query).collect { |m| m.with_indifferent_access }
  end

end
