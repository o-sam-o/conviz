class DataController < ApplicationController

  caches_page :boats, :destinations, :departure_dates, :court_counties, :terms, :names

  def boats
    @boats = Convict.boat_stats
    @top_boats = Convict.top_boat_stats
  end

  def destinations
    @destinations = Convict.destination_stats
    @aust_destinations = Convict.aust_destination_stats
    @state_destinations = Convict.state_destination_stats
  end

  def departure_dates
    @years, @years_map = Convict.year_stats
    @months = Convict.month_stats
    @decades = Convict.decade_stats
  end

  def court_counties
    @counties = Convict.court_county_stats
    @top_counties = Convict.top_county_stats
  end

  def terms
    @terms = Convict.term_stats
    @term_ranges = Convict.term_range_stats
    @term_decades = Convict.term_decade_range_stats
  end

  def names
    @first_names = Convict.first_name_stats
    @last_names = Convict.last_name_stats
  end

end
