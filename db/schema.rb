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

ActiveRecord::Schema.define(:version => 20110507060607) do

  create_table "convicts", :force => true do |t|
    t.string  "name",           :limit => 1024
    t.string  "description",    :limit => 1024
    t.string  "boat",           :limit => 1024
    t.string  "departure_date", :limit => 1024
    t.integer "departure_year"
    t.integer "depature_month"
    t.string  "destination",    :limit => 1024
    t.string  "court_and_term", :limit => 1024
    t.string  "court",          :limit => 1024
    t.string  "court_county",   :limit => 1024
    t.string  "term",           :limit => 1024
    t.string  "source",         :limit => 1024
  end

  create_table "counties", :force => true do |t|
    t.string   "name"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
