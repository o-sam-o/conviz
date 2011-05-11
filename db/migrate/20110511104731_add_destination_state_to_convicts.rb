class AddDestinationStateToConvicts < ActiveRecord::Migration
  def self.up
    add_column :convicts, :destination_state, :string
  end

  def self.down
    remove_column :convicts, :destination_state
  end
end
