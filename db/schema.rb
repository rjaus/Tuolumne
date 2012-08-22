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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120819130322) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.integer  "angellist_id"
    t.string   "angellist_url"
    t.string   "logo_url"
    t.string   "company_url"
    t.string   "twitter_url"
    t.string   "blog_url"
    t.string   "product_desc"
    t.string   "follower_count"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "high_concept"
  end

  create_table "company_people", :force => true do |t|
    t.integer  "company_id"
    t.integer  "person_id"
    t.string   "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "company_people", ["company_id", "person_id", "role"], :name => "index_company_people_on_company_id_and_person_id_and_role"

  create_table "people", :force => true do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "blog_url"
    t.string   "online_bio_url"
    t.string   "twitter_url"
    t.string   "facebook_url"
    t.string   "linkedin_url"
    t.integer  "follower_count"
    t.string   "angellist_url"
    t.string   "email"
    t.string   "phone"
    t.string   "email2"
    t.string   "email3"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.string   "image"
    t.integer  "angellist_id"
    t.string   "aboutme_url"
    t.string   "github_url"
    t.string   "dribbble_url"
    t.string   "behance_url"
    t.string   "what_ive_built"
    t.datetime "last_angel_list_update", :default => '2011-08-19 13:12:49'
    t.datetime "last_website_scrape",    :default => '2011-08-19 13:12:49'
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
