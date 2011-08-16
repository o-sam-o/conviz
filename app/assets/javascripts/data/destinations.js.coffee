class DestinationsYuiTable extends @YuiTable
  constructor: (rawTable, yuiTableDiv) ->
    super rawTable, yuiTableDiv, "destination"

  getTableSchema: ->
    {
      fields: [
         {key:"link"}, 
         {key:"destination"}, 
         {key:"state"}, 
         {key:"convicts", parser: "number"},
      ]
    }

  getColumnDefs: ->
    [
      {key:"destination", label: "Destination", sortable:true, resizeable:true},
      {key:"state", label: "State", sortable:true, resizeable:true},
      {key:"convicts", label: "Convicts", formatter: "number", sortable:true, resizeable:true},
    ]

  getClickUrl: (record) ->
    "/convicts/?destination=#{record.getData('destination')}"

new DestinationsYuiTable('raw-destinations-table', 'data-table')
