class BreakNameInConvicts < ActiveRecord::Migration
  def self.up
    add_column :convicts, :first_name, :string
    add_column :convicts, :last_name, :string
  end

  def self.down
    remove_column :convicts, :first_name
    remove_column :convicts, :last_name
  end
end
