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

ActiveRecord::Schema.define(version: 20190504150230) do

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
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "tel"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
