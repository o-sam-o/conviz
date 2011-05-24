# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110521122507) do

  create_table "convicts", :force => true do |t|
    t.string   "name"
    t.string   "description",       :limit => 1024
    t.string   "boat"
    t.date     "departure_date"
    t.integer  "departure_year"
    t.integer  "departure_month"
    t.string   "destination"
    t.string   "court_and_term"
    t.string   "court"
    t.string   "court_county"
    t.string   "term"
    t.string   "source",            :limit => 1024
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "raw_destination"
    t.string   "destination_state"
    t.string   "copyright",         :limit => 1024
    t.string   "alias_name"
  end

  create_table "counties", :force => true do |t|
    t.string   "name"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "alias"
  end

  create_table "destinations", :force => true do |t|
    t.string   "name"
    t.string   "current_name"
    t.string   "state"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
