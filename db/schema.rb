# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141118005509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crimes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "incident_id"
    t.integer  "offense_id"
    t.integer  "offense_code"
    t.integer  "offense_code_extension"
    t.integer  "offense_type_id"
    t.string   "offense_category_id"
    t.string   "first_occurrence_date"
    t.string   "last_occurrence_date"
    t.string   "reported_date"
    t.string   "incident_address"
    t.string   "geo_x"
    t.string   "geo_y"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "district_id"
    t.string   "precinct_id"
    t.string   "neighborhood_id"
    t.integer  "is_crime"
    t.integer  "is_traffic"
  end

end
