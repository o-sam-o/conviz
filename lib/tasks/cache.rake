require 'net/http'

desc 'remove all cache entries'
task :sweep_cache do
  `rm #{Rails.root}/public/index.html`
  `rm #{Rails.root}/public/home/about.html`

  `rm #{Rails.root}/public/data/boats.html`
  `rm #{Rails.root}/public/data/destinations.html`
  `rm #{Rails.root}/public/data/departure_dates.html`
  `rm #{Rails.root}/public/data/court_counties.html`
  `rm #{Rails.root}/public/data/terms.html`
  `rm #{Rails.root}/public/data/names.html`
end

desc 'seed cache'
task :seed_cache do
    conviz_domain = 'conviz.info'

    Net::HTTP.get conviz_domain, '/'

    Net::HTTP.get conviz_domain, '/data/boats'
    Net::HTTP.get conviz_domain, '/data/destinations'
    Net::HTTP.get conviz_domain, '/data/departure_dates'
    Net::HTTP.get conviz_domain, '/data/court_counties'
    Net::HTTP.get conviz_domain, '/data/terms'
    Net::HTTP.get conviz_domain, '/data/names'
end
