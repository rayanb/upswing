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

ActiveRecord::Schema.define(version: 20150505175826) do

  create_table "friend_requests", force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "friend_id", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "friend_id", null: false
  end

  create_table "industries", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string  "company_name"
    t.string  "title"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                                                                                                                                                 null: false
    t.string   "email"
    t.string   "provider",                                                                                                                                             null: false
    t.string   "uid",                                                                                                                                                  null: false
    t.string   "oauth_token",                                                                                                                                          null: false
    t.string   "location_city"
    t.string   "location_state"
    t.float    "location_longitude"
    t.float    "location_latitude"
    t.string   "picture_url",        default: "https://cdn1.iconfinder.com/data/icons/photography-2/512/YPS__human_avatar_portrait_photography_picture_photo-512.png"
    t.integer  "industry_id"
    t.string   "job",                default: "Job"
    t.text     "specialty"
    t.string   "golfcourse",         default: "N/A"
    t.string   "handicap",           default: "N/A"
    t.string   "golf_associations",  default: "N/A"
    t.string   "rounds_played",      default: "N/A"
    t.string   "member_at",          default: "N/A"
    t.string   "favorite_club",      default: "N/A"
    t.string   "availability",       default: "N/A"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                                                                                                                                           null: false
    t.datetime "updated_at",                                                                                                                                           null: false
  end

end
