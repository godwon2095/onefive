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

ActiveRecord::Schema.define(version: 20180810124944) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "alarms", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "findable_id"
    t.boolean  "is_read"
    t.integer  "alarm_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "alarms", ["findable_id"], name: "index_alarms_on_findable_id"
  add_index "alarms", ["user_id"], name: "index_alarms_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "content"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "follows", ["followed_id"], name: "index_follows_on_followed_id"
  add_index "follows", ["follower_id", "followed_id"], name: "index_follows_on_follower_id_and_followed_id", unique: true
  add_index "follows", ["follower_id"], name: "index_follows_on_follower_id"

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "subtitle"
    t.text     "content"
    t.string   "music_images", default: "--- []\n"
    t.string   "music_titles", default: "--- []\n"
    t.integer  "user_id"
    t.integer  "view_count",   default: 0
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "image"
  end

  create_table "singers", force: :cascade do |t|
    t.string   "name"
    t.string   "company"
    t.integer  "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "singers", ["company"], name: "index_singers_on_company"
  add_index "singers", ["name", "company", "uid"], name: "index_singers_on_name_and_company_and_uid", unique: true
  add_index "singers", ["name"], name: "index_singers_on_name"

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.integer  "singer_id"
    t.string   "album"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "songs", ["album"], name: "index_songs_on_album"
  add_index "songs", ["image"], name: "index_songs_on_image"
  add_index "songs", ["singer_id"], name: "index_songs_on_singer_id"
  add_index "songs", ["title", "singer_id", "album", "image"], name: "index_songs_on_title_and_singer_id_and_album_and_image", unique: true
  add_index "songs", ["title"], name: "index_songs_on_title"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "thumbnail"
    t.text     "information"
    t.string   "phonenumber"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "identity"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
