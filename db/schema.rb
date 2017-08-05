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

ActiveRecord::Schema.define(version: 20170805204610) do

  create_table "crawls", force: :cascade do |t|
    t.string   "gwamokid"
    t.string   "campus"
    t.string   "haksu"
    t.string   "boonban"
    t.string   "isoo"
    t.string   "gwamok"
    t.string   "gyosoo"
    t.string   "hakjum"
    t.string   "timeplace1"
    t.string   "timeplace2"
    t.string   "timeplace3"
    t.string   "timeplace4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dannies", force: :cascade do |t|
    t.string   "userid1"
    t.string   "userid2"
    t.string   "userid3"
    t.string   "userid4"
    t.string   "userid5"
    t.string   "userid6"
    t.string   "userid7"
    t.string   "userid8"
    t.string   "userid9"
    t.string   "userid10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "gwamokid"
    t.string   "username"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "attachment"
    t.string   "category"
  end

  create_table "replies", force: :cascade do |t|
    t.string   "reply_user"
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "replies", ["post_id"], name: "index_replies_on_post_id"

  create_table "sigandannies", force: :cascade do |t|
    t.string   "userid1"
    t.string   "userid2"
    t.string   "userid3"
    t.string   "userid4"
    t.string   "userid5"
    t.string   "userid6"
    t.string   "userid7"
    t.string   "userid8"
    t.string   "userid9"
    t.string   "userid10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sigans", force: :cascade do |t|
    t.string   "gwamokid"
    t.string   "username"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "attachment"
  end

  create_table "siplies", force: :cascade do |t|
    t.string   "reply_user"
    t.text     "body"
    t.integer  "sigan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "siplies", ["sigan_id"], name: "index_siplies_on_sigan_id"

  create_table "usergwamoks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "crawl_id"
    t.string   "gwamokid"
    t.string   "rhoonjang"
    t.string   "campus"
    t.string   "haksu"
    t.string   "boonban"
    t.string   "isoo"
    t.string   "gwamok"
    t.string   "gyosoo"
    t.string   "hakjum"
    t.string   "timeplace1"
    t.string   "timeplace2"
    t.string   "timeplace3"
    t.string   "timeplace4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "nickname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
