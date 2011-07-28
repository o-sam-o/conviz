# Place your application-specific JavaScript functions and classes here
# This file is automatically included by javascript_include_tag :defaults
#= require jquery

# Looks like YUI uses native JS to parse the dates, doesnt work in some browsers e.g. safari and older versions of IE
@supportsDateParsing = () -> YAHOO.util.DataSource.parseDate('2011-05-01').getMonth() == 4

@customDateFormatter = (elCell, oRecord, oColumn, oDate) ->
  return '' unless oDate
  switch oDate.getMonth()
    when 0 then sMonth = 'Jan'
    when 1 then sMonth = 'Feb'
    when 2 then sMonth = 'Mar'
    when 3 then sMonth = 'Apr'
    when 4 then sMonth = 'May'
    when 5 then sMonth = 'Jun'
    when 6 then sMonth = 'Jul'
    when 7 then sMonth = 'Aug'
    when 8 then sMonth = 'Sep'
    when 9 then sMonth = 'Oct'
    when 10 then sMonth = 'Nov'
    when 11 then sMonth = 'Dec'
  elCell.innerHTML = "#{oDate.getDate()}  #{sMonth}  #{oDate.getFullYear()}"
