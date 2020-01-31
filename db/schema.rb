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

ActiveRecord::Schema.define(version: 2020_01_30_212802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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

  create_table "bonds", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "relationship"
    t.date "birthday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_bonds_on_person_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.date "date"
    t.integer "duration"
    t.string "role"
    t.text "description"
    t.string "title"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_events_on_person_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "experience_type"
    t.date "start_date"
    t.date "end_date"
    t.string "location"
    t.text "description"
    t.string "role"
    t.integer "person_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "current", default: false
    t.index ["person_id"], name: "index_experiences_on_person_id"
  end

  create_table "interactions", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "user_id", null: false
    t.string "location"
    t.boolean "private_interaction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_interactions_on_person_id"
    t.index ["user_id"], name: "index_interactions_on_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.bigint "person_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_interests_on_person_id"
  end

  create_table "links", id: false, force: :cascade do |t|
    t.bigint "person_one_id"
    t.bigint "person_two_id"
    t.index ["person_one_id"], name: "index_links_on_person_one_id"
    t.index ["person_two_id"], name: "index_links_on_person_two_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relationships", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "person_id"
    t.index ["person_id"], name: "index_relationships_on_person_id"
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "reminders", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.string "memorable_type"
    t.bigint "memorable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["memorable_type", "memorable_id"], name: "index_reminders_on_memorable_type_and_memorable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: ""
    t.string "last_name", default: ""
    t.date "birthday"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bonds", "people"
  add_foreign_key "events", "people"
  add_foreign_key "experiences", "people"
  add_foreign_key "interactions", "people"
  add_foreign_key "interactions", "users"
  add_foreign_key "interests", "people"
end
