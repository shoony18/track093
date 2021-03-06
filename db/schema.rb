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

ActiveRecord::Schema.define(version: 20190815144214) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "titleimg"
    t.string   "lead"
    t.string   "topic1"
    t.string   "content1"
    t.string   "img1"
    t.string   "topic2"
    t.string   "content2"
    t.string   "img2"
    t.string   "topic3"
    t.string   "content3"
    t.string   "img3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "genre"
    t.string   "youtube"
  end

  create_table "calenders", force: :cascade do |t|
    t.integer  "date_yy"
    t.integer  "date_mm"
    t.integer  "date_dd"
    t.integer  "day_of_the_weekend"
    t.string   "color"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "comment_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer  "member_id"
    t.string   "content"
    t.string   "program"
    t.integer  "date_yy"
    t.integer  "date_mm"
    t.integer  "date_dd"
    t.integer  "target"
    t.string   "plan_comment"
    t.integer  "result"
    t.string   "evaluation"
    t.string   "after_comment"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "lives", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "date_yy"
    t.integer  "date_mm"
    t.integer  "date_dd"
    t.integer  "sleep_time_lastnight"
    t.integer  "body_temp"
    t.integer  "body_height"
    t.integer  "body_weight"
    t.string   "body_feeling"
    t.integer  "injury"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "trainings", force: :cascade do |t|
    t.integer  "member_id"
    t.string   "daymenu_title"
    t.string   "daymenu_content"
    t.integer  "date_yy"
    t.integer  "date_mm"
    t.integer  "date_dd"
    t.string   "genre"
    t.string   "stress"
    t.string   "plan_comment"
    t.integer  "done"
    t.string   "evaluation"
    t.string   "after_comment"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "tel"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
