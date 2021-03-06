# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_13_215302) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.integer "addressable_id"
    t.string "addressable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.string "name", null: false
    t.string "event_type", null: false
    t.date "date", null: false
    t.time "event_time", null: false
    t.time "access_time", null: false
    t.time "exit_time", null: false
    t.boolean "recurring"
    t.text "description"
    t.integer "attendance", null: false
    t.boolean "catering"
    t.boolean "alcohol"
    t.boolean "lighting"
    t.boolean "spotlight"
    t.boolean "sound"
    t.boolean "microphones"
    t.boolean "security"
    t.boolean "road_closure"
    t.decimal "daily_rate", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "venue_id"
    t.integer "organizer_id"
    t.boolean "contract"
    t.boolean "deposit"
    t.boolean "paid"
  end

  create_table "bookings_employees", force: :cascade do |t|
    t.integer "booking_id"
    t.integer "employee_id"
    t.index ["booking_id"], name: "index_bookings_employees_on_booking_id"
    t.index ["employee_id"], name: "index_bookings_employees_on_employee_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "via", null: false
    t.string "value", null: false
    t.integer "contactable_id"
    t.string "contactable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", null: false
    t.date "start_date", null: false
    t.date "end_date"
    t.boolean "active", null: false
    t.decimal "rate", null: false
    t.integer "user_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.string "name"
    t.integer "venue_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "quantity"
    t.text "notes"
    t.integer "inventory_id"
  end

  create_table "organizers", force: :cascade do |t|
    t.string "name", null: false
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "organization_type"
  end

  create_table "organizers_users", force: :cascade do |t|
    t.integer "organizer_id"
    t.integer "user_id"
  end

  create_table "point_of_contacts", force: :cascade do |t|
    t.string "name", null: false
    t.integer "organizer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "notes"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "google_uid"
    t.string "slug"
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.integer "seats", null: false
    t.string "configuration", null: false
    t.integer "greenrooms", null: false
    t.integer "dressing_rooms", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
