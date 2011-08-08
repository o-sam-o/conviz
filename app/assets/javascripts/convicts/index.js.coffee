class ConvictsYuiTable extends @YuiTable
  getTableSchema: ->
    {
      fields: [
         {key:"id"}, 
         {key:"name"},
         {key:"boat"},
         {key:"departure_date", parser:'date'},
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
    "/convicts/#{record.getData('id')}"

  getSortUrl: (column, direction) ->
    "/convicts?sort=#{column.getKey()}&direction=#{direction}"

# TODO parse sort and sort dir
convictsTable = new ConvictsYuiTable("raw-data-table", "convicts-table")
