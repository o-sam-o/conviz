class DataController < ApplicationController

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

end
