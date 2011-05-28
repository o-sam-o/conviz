desc 'remove all cache entries'
task :sweep_cache => :environment do
  ApplicationController.expire_page :controller => :home, :action => :index
  ApplicationController.expire_page :controller => :home, :action => :about

  ApplicationController.expire_page :controller => :data, :action => :boats
  ApplicationController.expire_page :controller => :data, :action => :destinations
  ApplicationController.expire_page :controller => :data, :action => :departure_dates
  ApplicationController.expire_page :controller => :data, :action => :court_counties
  ApplicationController.expire_page :controller => :data, :action => :terms
  ApplicationController.expire_page :controller => :data, :action => :names
end

