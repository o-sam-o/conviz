class AddCopyrightToConvicts < ActiveRecord::Migration
  def self.up
    add_column :convicts, :copyright, :string, :limit => 1024
  end

  def self.down
    remove_column :convicts, :copyright
  end
end
