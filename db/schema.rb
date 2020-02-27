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

ActiveRecord::Schema.define(version: 2020_02_27_202233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hairs", force: :cascade do |t|
    t.bigint "user_id"
    t.string "ethnicity"
    t.integer "weight_grams"
    t.integer "length_cm"
    t.float "price"
    t.string "hair_type"
    t.string "colour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "sold", default: false
    t.index ["user_id"], name: "index_hairs_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "hair_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hair_id"], name: "index_purchases_on_hair_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "role"
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "hairs", "users"
  add_foreign_key "purchases", "hairs"
  add_foreign_key "purchases", "users"
end
