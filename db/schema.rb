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

ActiveRecord::Schema.define(:version => 20130410223845) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.integer  "order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

  create_table "events", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.string   "title",       :null => false
    t.date     "date",        :null => false
    t.string   "website"
    t.string   "street",      :null => false
    t.string   "city",        :null => false
    t.string   "postal_code", :null => false
    t.text     "description", :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "jobs", :force => true do |t|
    t.integer  "user_id",      :null => false
    t.string   "company_name"
    t.string   "email"
    t.string   "website"
    t.string   "post_name"
    t.string   "street"
    t.string   "city"
    t.string   "postal_code"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "jobs", ["user_id"], :name => "index_jobs_on_user_id"

  create_table "page_translations", :force => true do |t|
    t.integer  "page_id"
    t.string   "locale"
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "page_translations", ["locale"], :name => "index_page_translations_on_locale"
  add_index "page_translations", ["page_id"], :name => "index_page_translations_on_page_id"

  create_table "pages", :force => true do |t|
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "slug"
    t.boolean  "home"
    t.boolean  "draft",       :default => true
    t.integer  "category_id"
    t.integer  "position"
  end

  add_index "pages", ["category_id"], :name => "index_pages_on_category_id"

  create_table "users", :force => true do |t|
    t.string   "github",                 :default => ""
    t.string   "twitter",                :default => ""
    t.boolean  "email_visible",          :default => true
    t.string   "website",                :default => ""
    t.string   "username",               :default => "",    :null => false
    t.string   "street",                 :default => ""
    t.string   "city",                   :default => ""
    t.string   "postal_code",            :default => "",    :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
