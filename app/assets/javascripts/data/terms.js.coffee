class TermsYuiTable extends @YuiTable
  constructor: (rawTable, yuiTableDiv) ->
    super rawTable, yuiTableDiv, "convicts"

  getTableSchema: ->
    {
      fields: [
         {key:"link"}, 
         {key:"term"}, 
         {key:"convicts", parser: "number"},
      ]
    }

  getColumnDefs: ->
    [
      {key:"term", label: "Sentence", sortable:true, resizeable:true},
      {key:"convicts", label: "Convicts", formatter: "number", sortable:true, resizeable:true},
    ]

  getClickUrl: (record) ->
    "/convicts/?term=#{record.getData('term')}"

new TermsYuiTable('raw-terms-table', 'data-table')

