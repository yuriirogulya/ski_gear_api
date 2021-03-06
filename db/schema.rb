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

ActiveRecord::Schema.define(version: 20180522131400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer "renter_id"
    t.integer "item_id"
    t.integer "price"
    t.date "start_date"
    t.date "end_date"
    t.boolean "completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_bookings_on_item_id"
    t.index ["renter_id"], name: "index_bookings_on_renter_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "filters", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_filters_on_category_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "owner_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.integer "daily_price"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["owner_id"], name: "index_items_on_owner_id"
  end

  create_table "items_options", id: false, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "option_id", null: false
    t.index ["item_id", "option_id"], name: "index_items_options_on_item_id_and_option_id"
    t.index ["option_id", "item_id"], name: "index_items_options_on_option_id_and_item_id"
  end

  create_table "options", force: :cascade do |t|
    t.integer "filter_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["filter_id"], name: "index_options_on_filter_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "author_id"
    t.integer "reviewable_id"
    t.string "reviewable_type"
    t.string "text"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_reviews_on_author_id"
    t.index ["reviewable_id", "reviewable_type"], name: "index_reviews_on_reviewable_id_and_reviewable_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
