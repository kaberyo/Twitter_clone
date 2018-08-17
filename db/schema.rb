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

ActiveRecord::Schema.define(version: 20180816220931) do

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "tweet_id",   limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "favorites", ["tweet_id"], name: "fk_rails_349c89a345", using: :btree
  add_index "favorites", ["user_id"], name: "fk_rails_d15744e438", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "notified_by_id", limit: 4
    t.integer  "tweet_id",       limit: 4
    t.string   "notified_type",  limit: 255
    t.boolean  "read",                       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["notified_by_id"], name: "index_notifications_on_notified_by_id", using: :btree
  add_index "notifications", ["tweet_id"], name: "index_notifications_on_tweet_id", using: :btree
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "following_id", limit: 4, null: false
    t.integer  "follower_id",  limit: 4, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "relationships", ["follower_id", "following_id"], name: "index_relationships_on_follower_id_and_following_id", unique: true, using: :btree
  add_index "relationships", ["following_id"], name: "fk_rails_a3d77c3b00", using: :btree

  create_table "retweets", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "owner_id",   limit: 4
    t.integer  "target_id",  limit: 4
  end

  add_index "retweets", ["owner_id", "target_id"], name: "index_retweets_on_owner_id_and_target_id", unique: true, using: :btree
  add_index "retweets", ["target_id"], name: "fk_rails_203a7ce61a", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "tags_count", limit: 255, default: "0", null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.string   "text",       limit: 140, null: false
    t.integer  "user_id",    limit: 4,   null: false
    t.string   "lcation",    limit: 255
    t.string   "media",      limit: 255
    t.integer  "parent_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tweets", ["user_id"], name: "fk_rails_003928b7f5", using: :btree

  create_table "tweets_tags", id: false, force: :cascade do |t|
    t.integer  "tweet_id",   limit: 4
    t.integer  "tag_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "tweets_tags", ["tag_id"], name: "index_tweets_tags_on_tag_id", using: :btree
  add_index "tweets_tags", ["tweet_id"], name: "index_tweets_tags_on_tweet_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255, default: "",  null: false
    t.string   "username",               limit: 255, default: "",  null: false
    t.string   "email",                  limit: 255, default: "",  null: false
    t.string   "encrypted_password",     limit: 255, default: "",  null: false
    t.string   "about",                  limit: 255
    t.string   "location",               limit: 255
    t.string   "website",                limit: 255
    t.string   "avator",                 limit: 255
    t.string   "cover",                  limit: 255
    t.string   "color",                  limit: 255
    t.string   "tweets_count",           limit: 255, default: "0", null: false
    t.string   "follows_count",          limit: 255, default: "0", null: false
    t.string   "followers_count",        limit: 255, default: "0", null: false
    t.string   "likes_count",            limit: 255, default: "0", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "favorited_count",        limit: 4,   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  add_foreign_key "favorites", "tweets"
  add_foreign_key "favorites", "users"
  add_foreign_key "notifications", "tweets"
  add_foreign_key "notifications", "users"
  add_foreign_key "notifications", "users", column: "notified_by_id"
  add_foreign_key "relationships", "tweets", column: "follower_id"
  add_foreign_key "relationships", "users", column: "following_id"
  add_foreign_key "retweets", "tweets", column: "owner_id"
  add_foreign_key "retweets", "tweets", column: "target_id"
  add_foreign_key "tweets", "users"
  add_foreign_key "tweets_tags", "tags"
  add_foreign_key "tweets_tags", "tweets"
end
