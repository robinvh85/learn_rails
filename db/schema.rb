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

ActiveRecord::Schema.define(version: 2018_10_02_080017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_logins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "login_type", default: 0, null: false
    t.index ["email"], name: "index_my_logins_on_email", unique: true
    t.index ["login_type"], name: "index_my_logins_on_login_type"
    t.index ["reset_password_token"], name: "index_my_logins_on_reset_password_token", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "price"
    t.integer "category_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :bigint, default: -> { "nextval('my_logins_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_my_logins_on_email_copy1", unique: true
    t.index ["reset_password_token"], name: "index_my_logins_on_reset_password_token_copy1", unique: true
  end

end
