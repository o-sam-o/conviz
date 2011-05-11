class AddRawDestinationToConvicts < ActiveRecord::Migration
  def self.up
    add_column :convicts, :raw_destination, :string
  end

  def self.down
    remove_column :convicts, :raw_destination
  end
end
