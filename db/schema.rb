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

ActiveRecord::Schema.define(version: 20151205194405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.integer  "category_id"
    t.string   "category_name"
    t.string   "cover_photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "comment_id"
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id", "post_id"], name: "index_comments_on_user_id_and_post_id", using: :btree

  create_table "cover_photos", force: true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cover_photos", ["post_id"], name: "index_cover_photos_on_post_id", using: :btree
  add_index "cover_photos", ["user_id", "post_id"], name: "index_cover_photos_on_user_id_and_post_id", using: :btree

  create_table "post_photos", force: true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_photos", ["post_id"], name: "index_post_photos_on_post_id", using: :btree
  add_index "post_photos", ["user_id", "post_id"], name: "index_post_photos_on_user_id_and_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "user_id",                     null: false
    t.integer  "category_id"
    t.string   "title"
    t.string   "intro"
    t.text     "body"
    t.string   "cover_photo"
    t.string   "post_photo"
    t.boolean  "published",   default: false
    t.boolean  "private",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "profile_photos", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_photos", ["user_id"], name: "index_profile_photos_on_user_id", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "relationship_id"
    t.integer  "leader_id"
    t.integer  "follower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["follower_id", "leader_id"], name: "index_relationships_on_follower_id_and_leader_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  add_index "relationships", ["leader_id"], name: "index_relationships_on_leader_id", using: :btree

  create_table "roles", force: true do |t|
    t.integer  "role_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.integer  "post_id"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["post_id"], name: "index_tags_on_post_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "string"
    t.integer  "role_id"
    t.string   "profile_photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["first_name", "last_name"], name: "index_users_on_first_name_and_last_name", using: :btree
  add_index "users", ["first_name"], name: "index_users_on_first_name", using: :btree
  add_index "users", ["last_name"], name: "index_users_on_last_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
