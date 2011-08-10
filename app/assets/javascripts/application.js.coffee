# Place your application-specific JavaScript functions and classes here
# This file is automatically included by javascript_include_tag :defaults
#= require jquery

#
# To extend YuiTable you need to implement the following methods:
# getTableSchema
# getColumnDefs
# getClickUrl(record)
# getSortUrl(column, direction)
#
class @YuiTable
  constructor: (@rawTable, @yuiTableDiv, @sortBy, @sortDirection) ->
    table = this
    $(document).ready -> table.setupTable()

  setupTable: (event) ->
    tableDS = new YAHOO.util.DataSource(YAHOO.util.Dom.get(@rawTable))
    tableDS.responseType = YAHOO.util.DataSource.TYPE_HTMLTABLE
    tableDS.responseSchema = @getTableSchema()

    dataTable = new YAHOO.widget.DataTable(@yuiTableDiv 
                                           @getColumnDefs()
                                           tableDS 
                                           {
                                             sortedBy: { 
                                               key: @sortBy
                                               dir: @getSortDirection()
                                             }
                                           })

    # Hightlight row on mouse hover
    dataTable.subscribe("rowMouseoverEvent", dataTable.onEventHighlightRow)
    dataTable.subscribe("rowMouseoutEvent", dataTable.onEventUnhighlightRow)

    # Handle user clicking on a row
    dataTable.subscribe("rowClickEvent", (oArgs, yuiTable) ->
        elTarget = oArgs.target
        oRecord = this.getRecord(elTarget)
        window.location.href = yuiTable.getClickUrl(oRecord)
    , this)

    # Handle column sorting
    yuiTable = this
    dataTable.doBeforeSortColumn = (oColumn, sSortDir) ->
      direction = if (sSortDir == YAHOO.widget.DataTable.CLASS_DESC) then "desc" else "asc"
      window.location.href = yuiTable.getSortUrl(oColumn, direction)
      return false

  getSortDirection: ->
    if @sortDirection == 'desc' then YAHOO.widget.DataTable.CLASS_DESC else YAHOO.widget.DataTable.CLASS_ASC

  parseDate: (rawDate) -> 
    return null unless rawDate

    yuiDate = YAHOO.util.DataSource.parseDate(rawDate)
    return yuiDate if yuiDate and yuiDate.getMonth()

    # If we get here the browser is unable to natively parse the date so we have to do it manually
    dateRegex = /(\d{4})-(\d{2})-(\d{2})/
    matches = dateRegex.exec rawDate
    if matches.length > 0
      return new Date(parseInt(matches[1]), parseInt(matches[2]), parseInt(matches[3]))
    else
      return null


  customDateFormatter: (elCell, oRecord, oColumn, oDate) ->
    return unless oDate
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
    return unless sMonth
    elCell.innerHTML = "#{oDate.getDate()}  #{sMonth}  #{oDate.getFullYear()}"
