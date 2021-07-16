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

ActiveRecord::Schema.define(version: 2021_07_16_020550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.string "application_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pet_applications", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "application_id"
    t.bigint "pet_id"
    t.index ["application_id"], name: "index_pet_applications_on_application_id"
    t.index ["pet_id"], name: "index_pet_applications_on_pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.integer "age"
    t.boolean "adoptable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shelter_id"
    t.index ["shelter_id"], name: "index_pets_on_shelter_id"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "rank"
    t.boolean "foster_program"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pet_id"
    t.index ["pet_id"], name: "index_shelters_on_pet_id"
  end

  add_foreign_key "pet_applications", "applications"
  add_foreign_key "pet_applications", "pets"
  add_foreign_key "pets", "shelters"
  add_foreign_key "shelters", "pets"
end
