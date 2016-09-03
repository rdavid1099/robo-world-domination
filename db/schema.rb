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

ActiveRecord::Schema.define(version: 20160903175912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.integer  "num_of_wins"
    t.integer  "num_of_losses"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "robots", force: :cascade do |t|
    t.string   "name"
    t.integer  "health"
    t.date     "creation_date"
    t.string   "avatar"
    t.string   "division"
    t.integer  "account_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "avatar"
    t.integer  "world_force_id"
    t.integer  "account_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "world_forces", force: :cascade do |t|
    t.integer  "total_wars_waged"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
