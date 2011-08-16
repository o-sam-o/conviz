class DepartureDatesYuiTable extends @YuiTable
  constructor: (rawTable, yuiTableDiv) ->
    super rawTable, yuiTableDiv, "departure_year"

  getTableSchema: ->
    {
      fields: [
         {key:"link"}, 
         {key:"departure_year", parser: "number"}, 
         {key:"convicts", parser: "number"},
      ]
    }

  getColumnDefs: ->
    [
      {key:"departure_year", label: "Departure Year", sortable:true, resizeable:true},
      {key:"convicts", label: "Convicts", formatter: "number", sortable:true, resizeable:true},
    ]

  getClickUrl: (record) ->
    "/convicts/?departure_year=#{record.getData('departure_year')}"

new DepartureDatesYuiTable('raw-departure-date-table', 'data-table')


