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

ActiveRecord::Schema.define(version: 20180103211331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_endorsements", force: :cascade do |t|
    t.integer "bill_id"
    t.integer "senator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.string "title"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_bills_on_author_id"
  end

  create_table "committee_memberships", force: :cascade do |t|
    t.integer "senator_id"
    t.integer "committee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "committees", force: :cascade do |t|
    t.string "name"
    t.string "mandate"
    t.integer "chairperson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "desks", force: :cascade do |t|
    t.string "model"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ideologies", force: :cascade do |t|
    t.string "name"
    t.string "direction"
    t.string "goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.integer "ideology_id"
    t.integer "party_leader_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "senators", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "state"
    t.integer "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
