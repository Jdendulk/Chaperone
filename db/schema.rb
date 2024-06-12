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

ActiveRecord::Schema[7.1].define(version: 2024_06_12_153126) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friend_meetings", force: :cascade do |t|
    t.bigint "friend_id", null: false
    t.bigint "meeting_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friend_meetings_on_friend_id"
    t.index ["meeting_id"], name: "index_friend_meetings_on_meeting_id"
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.string "phone"
    t.string "name"
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.float "longitude"
    t.float "latitude"
    t.bigint "meeting_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_locations_on_meeting_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.time "start_time"
    t.time "end_time"
    t.date "date"
    t.string "who"
    t.string "what"
    t.string "initial_meet_location"
    t.datetime "fake_call"
    t.string "how_did_it_go"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration"
    t.index ["user_id"], name: "index_meetings_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "meeting_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_messages_on_meeting_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "mobile_number"
    t.string "address"
    t.string "gender"
    t.string "sexuality"
    t.boolean "admin"
    t.string "share_code"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friend_meetings", "friends"
  add_foreign_key "friend_meetings", "meetings"
  add_foreign_key "friends", "users"
  add_foreign_key "locations", "meetings"
  add_foreign_key "meetings", "users"
  add_foreign_key "messages", "meetings"
  add_foreign_key "messages", "users"
end
