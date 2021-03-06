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

ActiveRecord::Schema.define(:version => 20140129182529) do

  create_table "contents", :force => true do |t|
    t.integer  "layout_id",       :null => false
    t.string   "parent_selector", :null => false
    t.text     "text"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "contents", ["layout_id"], :name => "index_contents_on_layout_id"

  create_table "layouts", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "html"
    t.integer  "page_id",     :null => false
    t.integer  "template_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "layouts", ["page_id"], :name => "index_layouts_on_page_id"

  create_table "pages", :force => true do |t|
    t.string   "title",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "templates", :force => true do |t|
    t.string   "name",       :null => false
    t.text     "html",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "password_digest",                    :null => false
    t.string   "session_token"
    t.string   "email",                              :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["password_digest"], :name => "index_users_on_password_digest"
  add_index "users", ["session_token"], :name => "index_users_on_session_token"

end
