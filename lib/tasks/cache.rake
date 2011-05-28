desc 'remove all cache entries'
task :sweep_cache => :environment do
  `rm #{Rails.root}/public/index.html`
  `rm #{Rails.root}/public/home/about.html`

  `rm #{Rails.root}/public/data/boats.html`
  `rm #{Rails.root}/public/data/destinations.html`
  `rm #{Rails.root}/public/data/departure_dates.html`
  `rm #{Rails.root}/public/data/court_counties.html`
  `rm #{Rails.root}/public/data/terms.html`
  `rm #{Rails.root}/public/data/names.html`
end
