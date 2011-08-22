class @ConvictsYuiTable extends @YuiTable
  constructor: (rawTable, yuiTableDiv, sortBy = 'name', sortDirection, @filteringParams) ->
    super rawTable, yuiTableDiv, sortBy, sortDirection

  setupTable: -> 
    super
    
    # Handle column sorting
    @dataTable.doBeforeSortColumn = (oColumn, sSortDir) =>
      direction = if (sSortDir == YAHOO.widget.DataTable.CLASS_DESC) then "desc" else "asc"
      window.location.href = @getSortUrl(oColumn, direction)
      return false


  getTableSchema: ->
    {
      fields: [
         {key:"id"}, 
         {key:"name"},
         {key:"boat"},
         {key:"departure_date", parser: @parseDate},
         {key:"court"},
         {key:"destination"}, 
         {key:"term"}
      ]
    }

  getColumnDefs: ->
    [
      {key:"name", label: "Name", sortable:true, resizeable:true},
      {key:"boat", label: "Boat", sortable:true, resizeable:true},
      {key:"departure_date", label: "Departure Date", formatter:@customDateFormatter, sortable:true, resizeable:true},
      {key:"court", label: "Court", sortable:true, resizeable:true},
      {key:"destination", label: "Destination", sortable:true, resizeable:true},
      {key:"term", label: "Sentence", sortable:true, resizeable:true}
    ]

  getClickUrl: (record) ->
    $(record.getData('name')).attr('href')

  getSortUrl: (column, direction) ->
    "/convicts?sort=#{column.getKey()}&direction=#{direction}#{@filteringParams}"
