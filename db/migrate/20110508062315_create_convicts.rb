class CreateConvicts < ActiveRecord::Migration
  def self.up
    create_table :convicts do |t|
      t.string :name
      t.string :description, :limit => 1024
      t.string :boat
      t.date   :departure_date
      t.integer :departure_year
      t.integer :departure_month
      t.string  :destination
      t.string  :court_and_term
      t.string  :court
      t.string  :court_county
      t.string  :term
      t.string  :source, :limit => 1024

      t.timestamps
    end
  end

  def self.down
    drop_table :convicts
  end
end
