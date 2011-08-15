class CountiesYuiTable extends @YuiTable
  constructor: (rawTable, yuiTableDiv) ->
    super rawTable, yuiTableDiv, "court_county", "desc"

  getTableSchema: ->
    {
      fields: [
         {key:"link"}, 
         {key:"court_county"}, 
         {key:"convicts", parser: "number"},
      ]
    }

  getColumnDefs: ->
    [
      {key:"court_county", label: "Court Counties", sortable:true, resizeable:true},
      {key:"convicts", label: "Convicts", formatter: "number", sortable:true, resizeable:true},
    ]

  getClickUrl: (record) ->
    "/convicts/?court_county=#{record.getData('court_county')}"

new CountiesYuiTable('raw-counties-table', 'data-table')

