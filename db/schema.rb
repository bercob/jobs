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

ActiveRecord::Schema.define(version: 20160105102456) do

  create_table "degrees", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "degrees", ["name"], name: "index_degrees_on_name", unique: true

  create_table "jobtypes", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "jobtypes", ["name"], name: "index_jobtypes_on_name", unique: true

  create_table "jobtypes_offers", id: false, force: :cascade do |t|
    t.integer "offer_id"
    t.integer "jobtype_id"
  end

  add_index "jobtypes_offers", ["offer_id", "jobtype_id"], name: "index_jobtypes_offers_on_offer_id_and_jobtype_id", unique: true

  create_table "languages", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "languages", ["name"], name: "index_languages_on_name", unique: true

  create_table "languages_users", id: false, force: :cascade do |t|
    t.integer "user_id",     null: false
    t.integer "language_id", null: false
  end

  add_index "languages_users", ["user_id", "language_id"], name: "index_languages_users_on_user_id_and_language_id", unique: true

  create_table "offer_sources", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "offer_sources", ["name"], name: "index_offer_sources_on_name", unique: true

  create_table "offercategories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "offercategories", ["name"], name: "index_offercategories_on_name", unique: true

  create_table "offercategories_offers", id: false, force: :cascade do |t|
    t.integer "offer_id",         null: false
    t.integer "offercategory_id", null: false
  end

  add_index "offercategories_offers", ["offer_id", "offercategory_id"], name: "index_offercategories_offers_on_offer_id_and_offercategory_id", unique: true

  create_table "offerpositions", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "offerpositions", ["name"], name: "index_offerpositions_on_name", unique: true

  create_table "offerpositions_offers", id: false, force: :cascade do |t|
    t.integer "offer_id",         null: false
    t.integer "offerposition_id", null: false
  end

  add_index "offerpositions_offers", ["offer_id", "offerposition_id"], name: "index_offerpositions_offers_on_offer_id_and_offerposition_id", unique: true

  create_table "offerregions", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "offerregions", ["name"], name: "index_offerregions_on_name", unique: true

  create_table "offerregions_offers", id: false, force: :cascade do |t|
    t.integer "offer_id",       null: false
    t.integer "offerregion_id", null: false
  end

  add_index "offerregions_offers", ["offer_id", "offerregion_id"], name: "index_offerregions_offers_on_offer_id_and_offerregion_id", unique: true

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
