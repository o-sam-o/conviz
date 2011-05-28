class AddTermRangeToConvicts < ActiveRecord::Migration
  def self.up
    add_column :convicts, :term_range, :string
  end

  def self.down
    remove_column :convicts, :term_range
  end
end
