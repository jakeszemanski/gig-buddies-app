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

ActiveRecord::Schema.define(version: 20170126001614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "band_concerts", force: :cascade do |t|
    t.integer  "band_id"
    t.integer  "concert_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.text     "description"
  end

  create_table "concerts", force: :cascade do |t|
    t.string   "doors"
    t.string   "show"
    t.integer  "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "date"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "description"
    t.integer  "venue_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "seller_id"
    t.integer  "concert_id"
    t.integer  "buyer_id"
    t.string   "compensation"
    t.string   "status",       default: "available"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "user_bands", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "user_id"
    t.string   "band_id"
  end

  create_table "user_concerts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "concert_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "phone"
    t.string   "profile_pic"
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "will_call_policy"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "address"
    t.string   "image"
  end

end
