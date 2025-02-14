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

ActiveRecord::Schema.define(:version => 20120306215257) do

  create_table "animals", :force => true do |t|
    t.string   "name"
    t.string   "habitat"
    t.boolean  "nocturnal"
    t.string   "diet"
    t.integer  "weight"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "conditions", :force => true do |t|
    t.string   "column",          :null => false
    t.string   "parameter",       :null => false
    t.integer  "operator_id",     :null => false
    t.integer  "query_id",        :null => false
    t.string   "complexOperator"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "conditions", ["operator_id"], :name => "index_conditions_on_operator_id"
  add_index "conditions", ["query_id"], :name => "index_conditions_on_query_id"

  create_table "datatypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "operators", :force => true do |t|
    t.string   "name"
    t.string   "sql_value"
    t.string   "html_representation"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "theme_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pages", ["theme_id"], :name => "index_pages_on_theme_id"
  add_index "pages", ["user_id"], :name => "index_pages_on_user_id"

  create_table "queries", :force => true do |t|
    t.string   "name"
    t.integer  "dummy_id"
    t.integer  "user_id",       :null => false
    t.text     "formatted_sql"
    t.text     "raw_sql"
    t.text     "html_table"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "queries", ["user_id"], :name => "index_queries_on_user_id"

  create_table "themes", :force => true do |t|
    t.string   "name"
    t.text     "data"
    t.string   "preview_img"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

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
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
