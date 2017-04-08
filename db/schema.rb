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

ActiveRecord::Schema.define(version: 20170408111437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "balance_informations", force: :cascade do |t|
    t.float    "amount"
    t.string   "note_number"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "percent_catalog_id"
    t.integer  "balance_id"
    t.index ["balance_id"], name: "index_balance_informations_on_balance_id", using: :btree
    t.index ["percent_catalog_id"], name: "index_balance_informations_on_percent_catalog_id", using: :btree
  end

  create_table "balances", force: :cascade do |t|
    t.float    "point"
    t.integer  "client_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "vendor_id"
    t.boolean  "archived",   default: false
    t.index ["client_id"], name: "index_balances_on_client_id", using: :btree
    t.index ["vendor_id"], name: "index_balances_on_vendor_id", using: :btree
  end

  create_table "branch_offices", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_branch_offices_on_name", unique: true, using: :btree
    t.index ["user_id"], name: "index_branch_offices_on_user_id", using: :btree
  end

  create_table "cards", force: :cascade do |t|
    t.string   "title"
    t.float    "percent"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cards_on_user_id", using: :btree
  end

  create_table "client_profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.date     "birthdate"
    t.string   "phone_model"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "client_id"
    t.string   "email"
    t.index ["client_id"], name: "index_client_profiles_on_client_id", using: :btree
    t.index ["email"], name: "index_client_profiles_on_email", unique: true, using: :btree
  end

  create_table "clients", force: :cascade do |t|
    t.string   "client_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.index ["client_number"], name: "index_clients_on_client_number", unique: true, using: :btree
    t.index ["user_id"], name: "index_clients_on_user_id", using: :btree
  end

  create_table "percent_catalogs", force: :cascade do |t|
    t.float    "percent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["percent"], name: "index_percent_catalogs_on_percent", unique: true, using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       default: "branch_office", null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["name"], name: "index_roles_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "userid"
    t.string   "password_digest"
    t.string   "auth_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "role_id"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
    t.index ["userid"], name: "index_users_on_userid", unique: true, using: :btree
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "archived",   default: false
    t.string   "email"
    t.index ["email"], name: "index_vendors_on_email", unique: true, using: :btree
    t.index ["user_id"], name: "index_vendors_on_user_id", using: :btree
  end

  add_foreign_key "balance_informations", "balances"
  add_foreign_key "balance_informations", "percent_catalogs"
  add_foreign_key "balances", "clients"
  add_foreign_key "balances", "vendors"
  add_foreign_key "branch_offices", "users"
  add_foreign_key "cards", "users"
  add_foreign_key "client_profiles", "clients"
  add_foreign_key "clients", "users"
  add_foreign_key "users", "roles"
  add_foreign_key "vendors", "users"
end
