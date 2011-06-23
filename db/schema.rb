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

ActiveRecord::Schema.define(:version => 20110619080001) do

  create_table "galeries", :force => true do |t|
    t.string   "galerie_name"
    t.string   "short_desc"
    t.datetime "date_galerie"
    t.binary   "picthumb"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.string   "filename"
    t.string   "picpath"
    t.integer  "height"
    t.integer  "width"
    t.string   "comment"
    t.datetime "date_orig"
    t.datetime "date_galerie"
    t.string   "model"
    t.string   "title_long"
    t.string   "country"
    t.integer  "galerie_id"
    t.string   "galerie_name"
    t.text     "description"
    t.string   "GPSLatitudeRef"
    t.string   "GPSLatitude"
    t.string   "GPSLongitudeRef"
    t.string   "GPSLongitude"
    t.integer  "GPSAltitudeRef"
    t.integer  "GPSAltitude"
    t.binary   "picthumb"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
