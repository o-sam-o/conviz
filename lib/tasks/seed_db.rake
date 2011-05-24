require 'geokit'

namespace :seed do
  desc 'populates the counties table'
  task :counties => :environment do
    County.delete_all
    insert_county(:name => 'Bedfordshire', :country => 'UK', :alias => 'Bedford')
    insert_county(:name => 'Berkshire', :country => 'UK', :alias => 'Berk')
    insert_county(:name => 'Bristol', :country => 'UK')
    insert_county(:name => 'Buckinghamshire', :country => 'UK', :alias => 'Buckingham;Bucks')
    insert_county(:name => 'Cambridgeshire', :country => 'UK', :alias => 'Cambridge')
    insert_county(:name => 'Cheshire', :country => 'UK', :alias => 'Chester')
    insert_county(:name => 'Cornwall', :country => 'UK')
    insert_county(:name => 'Cumbria', :country => 'UK', :alias => 'Cumberland')
    insert_county(:name => 'Derbyshire', :country => 'UK', :alias => 'Derby')
    insert_county(:name => 'Devon', :country => 'UK')
    insert_county(:name => 'Dorset', :country => 'UK')
    insert_county(:name => 'Durham', :country => 'UK')
    insert_county(:name => 'East Riding', :country => 'UK')
    insert_county(:name => 'East Sussex', :country => 'UK', :alias => 'Sussex')
    insert_county(:name => 'East Yorkshire', :country => 'UK')
    insert_county(:name => 'Essex', :country => 'UK')
    insert_county(:name => 'Gloucestershire', :country => 'UK', :alias => 'Gloucester')
    insert_county(:name => 'Greater London', :country => 'UK', :alias => 'London;Central Criminal Court')
    insert_county(:name => 'Greater Manchester', :country => 'UK', :alias => 'Manchester')
    insert_county(:name => 'Hampshire', :country => 'UK', :alias => 'Southampton')
    insert_county(:name => 'Herefordshire', :country => 'UK', :alias => 'Hereford')
    insert_county(:name => 'Hertfordshire', :country => 'UK', :alias => 'Hertford')
    insert_county(:name => 'Huntingdonshire', :country => 'UK', :alias => 'Huntingdon')
    insert_county(:name => 'Kent', :country => 'UK', :alias => 'Chatham')
    insert_county(:name => 'Lancashire', :country => 'UK', :alias => 'Lancaster')
    insert_county(:name => 'Leicestershire', :country => 'UK', :alias => 'Leicester')
    insert_county(:name => 'Lincolnshire', :country => 'UK', :alias => 'Lincoln')
    insert_county(:name => 'Merseyside', :country => 'UK')
    insert_county(:name => 'Middlesex', :country => 'UK')
    insert_county(:name => 'Norfolk', :country => 'UK')
    insert_county(:name => 'North Yorkshire', :country => 'UK', :alias => 'York')
    insert_county(:name => 'Northamptonshire', :country => 'UK', :alias => 'Northampton')
    insert_county(:name => 'Northumberland', :country => 'UK')
    insert_county(:name => 'Nottinghamshire', :country => 'UK', :alias => 'Nottingham')
    insert_county(:name => 'Oxfordshire', :country => 'UK', :alias => 'Oxford')
    insert_county(:name => 'Rutland', :country => 'UK')
    insert_county(:name => 'Shropshire', :country => 'UK', :alias => 'Salop')
    insert_county(:name => 'Somerset', :country => 'UK')
    insert_county(:name => 'South Yorkshire', :country => 'UK')
    insert_county(:name => 'Staffordshire', :country => 'UK', :alias => 'Stafford')
    insert_county(:name => 'Suffolk', :country => 'UK')
    insert_county(:name => 'Surrey', :country => 'UK')
    insert_county(:name => 'Tyne and Wear', :country => 'UK')
    insert_county(:name => 'Warwickshire', :country => 'UK', :alias => 'Warwick')
    insert_county(:name => 'Westmorland', :country => 'UK')
    insert_county(:name => 'Wiltshire', :country => 'UK', :alias => 'Wilts')
    insert_county(:name => 'Worcestershire', :country => 'UK', :alias => 'Worcester')
    insert_county(:name => 'West Sussex', :country => 'UK')
    insert_county(:name => 'West Yorkshire', :country => 'UK')
    insert_county(:name => 'Anglesey', :country => 'UK')
    insert_county(:name => 'Blaenau Gwent', :country => 'UK')
    insert_county(:name => 'Bridgend', :country => 'UK')
    insert_county(:name => 'Cardiff', :country => 'UK')
    insert_county(:name => 'Caerphilly', :country => 'UK')
    insert_county(:name => 'Carmarthenshire', :country => 'UK', :alias => 'Carmarthen')
    insert_county(:name => 'Cerdigion', :country => 'UK')
    insert_county(:name => 'Conwy', :country => 'UK')
    insert_county(:name => 'Denbighshire', :country => 'UK', :alias => 'Denbigh')
    insert_county(:name => 'Flintshire', :country => 'UK', :alias => 'Flint')
    insert_county(:name => 'Gwynedd', :country => 'UK')
    insert_county(:name => 'Merthyr Tydfil', :country => 'UK')
    insert_county(:name => 'Monmouthshire', :country => 'UK', :alias => 'Monmouth')
    insert_county(:name => 'Neath Port Talbot', :country => 'UK')
    insert_county(:name => 'Newport', :country => 'UK')
    insert_county(:name => 'Pembrokeshire', :country => 'UK', :alias => 'Pembrok')
    insert_county(:name => 'Powys', :country => 'UK')
    insert_county(:name => 'Rhondda Cynon Taff', :country => 'UK')
    insert_county(:name => 'Swansea', :country => 'UK')
    insert_county(:name => 'The Vale of Glamorgan', :country => 'UK')
    insert_county(:name => 'Torfaen', :country => 'UK')
    insert_county(:name => 'Wrexham', :country => 'UK')

    insert_county(:name => 'Aberdeen', :country => 'UK')
    insert_county(:name => 'Aberdeenshire', :country => 'UK')
    insert_county(:name => 'Angus', :country => 'UK')
    insert_county(:name => 'Argyll and Bute', :country => 'UK')
    insert_county(:name => 'Clackmannanshire', :country => 'UK')
    insert_county(:name => 'Dumfries and Galloway', :country => 'UK', :alias => 'Dumfries')
    insert_county(:name => 'East Ayrshire', :country => 'UK')
    insert_county(:name => 'East Dunbartonshire', :country => 'UK')
    insert_county(:name => 'East Lothian', :country => 'UK')
    insert_county(:name => 'Edinburgh', :country => 'UK')
    insert_county(:name => 'Eilean Siar', :country => 'UK')
    insert_county(:name => 'Falkirk', :country => 'UK')
    insert_county(:name => 'Fife', :country => 'UK')
    insert_county(:name => 'Glasgow', :country => 'UK', :alias => 'Glascow')
    insert_county(:name => 'Highland', :country => 'UK', :alias => 'Inverness')
    insert_county(:name => 'Inverclyde', :country => 'UK')
    insert_county(:name => 'Midlothian', :country => 'UK')
    insert_county(:name => 'Moray', :country => 'UK')
    insert_county(:name => 'North Ayrshire', :country => 'UK')
    insert_county(:name => 'North Lanarkshire', :country => 'UK')
    insert_county(:name => 'Orkney Islands', :country => 'UK')
    insert_county(:name => 'Perth and Kinross', :country => 'UK', :alias => 'Perth')
    insert_county(:name => 'Renfrewshire', :country => 'UK', :alias => 'Renfrew')
    insert_county(:name => 'Shetland Islands', :country => 'UK')
    insert_county(:name => 'South Ayrshire', :country => 'UK', :alias => 'Ayr')
    insert_county(:name => 'South Lanarkshire', :country => 'UK')
    insert_county(:name => 'Stirling', :country => 'UK')
    insert_county(:name => 'The Scottish Borders', :country => 'UK')
    insert_county(:name => 'West Dunbartonshire', :country => 'UK')
    insert_county(:name => 'West Lothian', :country => 'UK')

    insert_county(:name => 'Isle of Man', :country => 'UK')

    insert_county(:name => 'Carlow', :country => 'IE')
    insert_county(:name => 'Cavan', :country => 'IE')
    insert_county(:name => 'Clare', :country => 'IE')
    insert_county(:name => 'Cork', :country => 'IE')
    insert_county(:name => 'Donegal', :country => 'IE')
    insert_county(:name => 'Dublin', :country => 'IE')
    insert_county(:name => 'Galway', :country => 'IE')
    insert_county(:name => 'Kerry', :country => 'IE')
    insert_county(:name => 'Kildare', :country => 'IE')
    insert_county(:name => 'Kilkenny', :country => 'IE')
    insert_county(:name => 'Laois', :country => 'IE')
    insert_county(:name => 'Leitrim', :country => 'IE')
    insert_county(:name => 'Limerick', :country => 'IE')
    insert_county(:name => 'Longford', :country => 'IE')
    insert_county(:name => 'Louth', :country => 'IE')
    insert_county(:name => 'Mayo', :country => 'IE')
    insert_county(:name => 'Meath', :country => 'IE')
    insert_county(:name => 'Monaghan', :country => 'IE')
    insert_county(:name => 'Offaly', :country => 'IE')
    insert_county(:name => 'Roscommon', :country => 'IE')
    insert_county(:name => 'Sligo', :country => 'IE')
    insert_county(:name => 'Tipperary', :country => 'IE')
    insert_county(:name => 'Waterford', :country => 'IE')
    insert_county(:name => 'Westmeath', :country => 'IE')
    insert_county(:name => 'Wexford', :country => 'IE')
    insert_county(:name => 'Wicklow', :country => 'IE')
  end

  desc 'populates the destinations table'
  task :destinations => :environment do
    Destination.delete_all
    insert_destination(:name => 'Norfolk Island', :state => 'NSW') 
    insert_destination(:name => "Port Phillip", :state => 'VIC') 
    insert_destination(:name => "Maria Island", :state => 'TAS') 
    insert_destination(:name => "New South Wales", :state => 'NSW') 
    insert_destination(:name => "Moreton Bay", :state => 'QLD') 
    insert_destination(:name => "Western Australia", :state => 'WA') 
    insert_destination(:name => "Van Diemen's Land", :current_name => 'Tasmania', :state => 'TAS') 
  end

  def insert_county(params)
    p params[:name]
    geo_result = Geokit::Geocoders::MultiGeocoder.geocode("#{params[:name]}, #{params[:country]}")
    params[:latitude] = geo_result.lat.to_s
    params[:longitude] = geo_result.lng.to_s
    County.create!(params)
  end

  def insert_destination(params)
    p params[:name]
    params[:current_name] = params[:name] unless params.key?(:current_name)
    geo_result = Geokit::Geocoders::MultiGeocoder.geocode("#{params[:current_name]}, #{params[:state]}")
    params[:latitude] = geo_result.lat.to_s
    params[:longitude] = geo_result.lng.to_s
    Destination.create!(params)
  end
end
