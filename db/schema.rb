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

ActiveRecord::Schema.define(version: 20160910200353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "divisions", force: :cascade do |t|
    t.string   "unit_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "platoons", force: :cascade do |t|
    t.string   "name"
    t.integer  "num_of_wins"
    t.integer  "num_of_losses"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_platoons_on_user_id", using: :btree
  end

  create_table "robots", force: :cascade do |t|
    t.string   "name"
    t.integer  "health"
    t.string   "avatar"
    t.integer  "division_id"
    t.integer  "platoon_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["division_id"], name: "index_robots_on_division_id", using: :btree
    t.index ["platoon_id"], name: "index_robots_on_platoon_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.date     "birthday"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.string   "avatar"
    t.integer  "role",                  default: 0
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_foreign_key "platoons", "users"
  add_foreign_key "robots", "divisions"
  add_foreign_key "robots", "platoons"
end
