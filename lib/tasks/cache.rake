desc 'remove all cache entries'
task :sweep_cache => :environment do
  ActionController::Base::expire_page('/')
  ActionController::Base::expire_page('/home/about')

  ActionController::Base::expire_page('/data/boats')
  ActionController::Base::expire_page('/data/destinations')
  ActionController::Base::expire_page('/data/departure_dates')
  ActionController::Base::expire_page('/data/court_counties')
  ActionController::Base::expire_page('/data/terms')
  ActionController::Base::expire_page('/data/names')
end

