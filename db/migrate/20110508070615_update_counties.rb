class UpdateCounties < ActiveRecord::Migration
  def self.up
    add_column :counties, :country, :string
    add_column :counties, :alias, :string
  end

  def self.down
    remove_column :counties, :country
    remove_column :counties, :alias
  end
end
