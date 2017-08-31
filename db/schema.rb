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

ActiveRecord::Schema.define(version: 20170831200756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string   "title",                                null: false
    t.date     "event_date",                           null: false
    t.integer  "cover_image_id"
    t.string   "status",         default: "Published", null: false
    t.string   "password"
    t.integer  "user_id",                              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["title", "user_id"], name: "index_albums_on_title_and_user_id", unique: true, using: :btree
  add_index "albums", ["user_id"], name: "index_albums_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "image_url",                 null: false
    t.float    "order",       default: 0.0, null: false
    t.integer  "subalbum_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_name",                 null: false
    t.string   "thumb_url",                 null: false
    t.string   "medium_url",                null: false
    t.datetime "date_taken",                null: false
  end

  add_index "photos", ["subalbum_id"], name: "index_photos_on_subalbum_id", using: :btree

  create_table "subalbums", force: :cascade do |t|
    t.string   "title",                    null: false
    t.float    "order",      default: 0.0, null: false
    t.integer  "album_id",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subalbums", ["album_id"], name: "index_subalbums_on_album_id", using: :btree
  add_index "subalbums", ["title", "album_id"], name: "index_subalbums_on_title_and_album_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                            null: false
    t.string   "password_digest",                  null: false
    t.string   "session_token",                    null: false
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "screenshot"
    t.string   "avatar"
    t.boolean  "activated",        default: false, null: false
    t.string   "activation_token",                 null: false
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
