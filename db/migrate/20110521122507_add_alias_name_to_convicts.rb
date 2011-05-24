class AddAliasNameToConvicts < ActiveRecord::Migration
  def self.up
    add_column :convicts, :alias_name, :string
  end

  def self.down
    remove_column :convicts, :alias_name
  end
end
