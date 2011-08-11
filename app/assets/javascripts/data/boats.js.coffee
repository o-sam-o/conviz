class BoatsYuiTable extends @YuiTable
  constructor: (rawTable, yuiTableDiv) ->
    super rawTable, yuiTableDiv, "boat", "desc"

  getTableSchema: ->
    {
      fields: [
         {key:"link"}, 
         {key:"boat"}, 
         {key:"convicts", parser: "number"},
         {key:"voyage_count", parser: "number"}
      ]
    }

  getColumnDefs: ->
    [
      {key:"boat", label: "Boat", sortable:true, resizeable:true},
      {key:"convicts", label: "Convicts", formatter: "number", sortable:true, resizeable:true},
      {key:"voyage_count", label: "Voyages", formatter: "number", sortable:true, resizeable:true}
    ]

  getClickUrl: (record) ->
    "/convicts/?boat=#{record.getData('boat')}"

new BoatsYuiTable('raw-boats-table', 'data-table')
