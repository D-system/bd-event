# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_21_023857) do

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "location", null: false
    t.datetime "start_datetime", null: false
    t.datetime "end_datetime", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uid"], name: "index_events_on_uid", unique: true
  end

  create_table "signups", force: :cascade do |t|
    t.integer "event_id"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id", "email"], name: "index_signups_on_event_id_and_email", unique: true
  end

  add_foreign_key "signups", "events", on_delete: :cascade
end
