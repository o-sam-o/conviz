class HomeController < ApplicationController

  caches_page :index, :about

  def index
    @years, @years_map = Convict.year_stats
    @top_boats = Convict.top_boat_stats
    @aust_destinations = Convict.aust_destination_stats
    @counties = Convict.court_county_stats
  end

  def about

  end

end
