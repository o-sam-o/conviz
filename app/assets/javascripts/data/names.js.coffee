class NamesYuiTable extends @YuiTable
  constructor: (rawTable, yuiTableDiv, @name_field, @name_label) ->
    super rawTable, yuiTableDiv, 'convicts'

  getTableSchema: ->
    {
      fields: [
         {key:"link"}, 
         {key:@name_field}, 
         {key:"convicts", parser: "number"},
      ]
    }

  getColumnDefs: ->
    [
      {key:@name_field, label: @name_label, sortable:true, resizeable:true},
      {key:"convicts", label: "Convicts", formatter: "number", sortable:true, resizeable:true},
    ]

  getClickUrl: (record) ->
    "/convicts/?#{@name_field}=#{record.getData(@name_field)}"

new NamesYuiTable('raw-first-names-table', 'first-name-data-table', 'first_name', 'First Name')
new NamesYuiTable('raw-last-names-table', 'last-name-data-table', 'last_name', 'Last Name')


