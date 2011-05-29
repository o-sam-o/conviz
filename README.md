# Conviz

## Overview
Conviz is a Rails web app that allows web based access and visualisation
of the [British Convict Transportation Registry](http://data.gov.au/dataset/british-convict-transportation-registers/).  
This project was started at Hack at the Mitchell and was developed as an entry for ({Library:/hack/})[http://libraryhack.org/].

## Features

### Convict Information
One of the basic functions on Conviz is it makes the registry information
available online in a user friendly format; which it achives with the
following features:

*  View the complete registry as paginated table; this feature also includes the
   ability to sort by any field e.g. date of departure or destination.
*  Search for convicts by name (first, last or both)
*  View all available information about a convict
*  Conviz has derived some additional information about each convict
   (e.g. county of conviction), this is displayed as along side the convict's records
*  Data cleansing (merging similar but slightly different fields), e.g.
   Boat names and destinations.

### Convict Filter
The registry contains a lot of entries (+123,000), Conviz allows the registry to be
filtered into smaller subsets of related convicts.

Convicts can be filtered by:

*  Boat
*  Destination
*  Departure year
*  Conviction county
*  Sentence
*  First or last name

### Visualisations
Visualisations (graphs, charts & maps) where the main reason for building
Conviz and the site currently includes the following visualisations:

*  Bar chart of boats that transported the most convicts
*  Bubble chart of the top 100 boats
*  Geo intensity map of convict destinations
*  Donut graph of convict destinations and destination states
*  Stack area graph of conviction year and destination state
*  Column chart of departure month
*  Pie chart of departure decade
*  Bar chart of top conviction counties
*  Google map with pins for all conviction counties
*  Pie chart of sentence severities
*  Column chart of conviction decade and sentence severity
*  Bar chart of most popular first names
*  Bar chart of most popular last names

## Code Quality
TODO

## More Doco Coming Soon

## Notes

Ideas

Pending

 * Convict photos
 * Add an indicator about fleet number e.g. leaving 1787 is first fleet
 * Link boats to wikipedia
 * Provide links to famous convicts
 * Add map ect to convict page
 * Make the top boats graph a stacked bar graph showing how many
   convicts per each voyage

TODO

 * Finalise Home Page
 * Add top of page warning back for ie6
 * Text for submission
 * Download all records as CSV
 * Add quality comment to counties page
 * Convict photos?

TODO POST LAUNCH

 * Fix YUI tables to allow SEO
 * Github read me

http://members.iinet.net.au/~perthdps/convicts/index.html

West Aust Ships:
http://en.wikipedia.org/wiki/List_of_convict_ships_to_Western_Australia

Famous Convict:
http://en.wikipedia.org/wiki/Convicts_in_Australia
