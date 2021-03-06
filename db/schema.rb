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

ActiveRecord::Schema.define(version: 2019_05_24_023046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "isbn"
    t.string "title", null: false
    t.string "publisher"
    t.string "authors", default: [], null: false, array: true
    t.text "description"
    t.string "category"
    t.string "thumbnail"
    t.integer "page", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deadline"
    t.integer "status", default: 0, null: false
    t.bigint "user_id", null: false
    t.integer "spent_time_sec", default: 0, null: false
    t.integer "current_page", default: 0, null: false
    t.bigint "book_id", null: false
    t.index ["book_id"], name: "index_cards_on_book_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "histories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "concrete_history_type"
    t.bigint "concrete_history_id"
    t.bigint "card_id", null: false
    t.index ["card_id"], name: "index_histories_on_card_id"
    t.index ["concrete_history_type", "concrete_history_id"], name: "index_histories_on_concrete_history"
  end

  create_table "read_histories", force: :cascade do |t|
    t.integer "page_count", default: 0, null: false
    t.integer "time_sec", default: 0, null: false
  end

  create_table "register_histories", force: :cascade do |t|
    t.integer "from", default: 0, null: false
    t.integer "to", default: 0, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
