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

ActiveRecord::Schema.define(version: 20160102115901) do

  create_table "degrees", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "degrees", ["name"], name: "index_degrees_on_name", unique: true

  create_table "languages", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "languages", ["name"], name: "index_languages_on_name", unique: true

  create_table "languages_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "languages_users", ["user_id", "language_id"], name: "index_languages_users_on_user_id_and_language_id", unique: true

  create_table "offer_sources", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "offer_sources", ["name"], name: "index_offer_sources_on_name", unique: true

  create_table "offers", force: :cascade do |t|
    t.string   "external_offer_id"
    t.date     "offerdate"
    t.datetime "last_update"
    t.string   "position"
    t.string   "location"
    t.string   "content"
    t.string   "url"
    t.string   "company"
    t.string   "ico"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "offer_source_id"
  end

  add_index "offers", ["external_offer_id"], name: "index_offers_on_external_offer_id"
  add_index "offers", ["offer_source_id"], name: "index_offers_on_offer_source_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.integer  "degree_id"
  end

  add_index "users", ["degree_id"], name: "index_users_on_degree_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
