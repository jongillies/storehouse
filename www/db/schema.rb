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

ActiveRecord::Schema.define(:version => 20130606163143) do

  create_table "blobs", :force => true do |t|
    t.string   "checksum"
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "data_sources", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.string   "contact"
    t.text     "primary_store"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "cron_schedule"
    t.text     "secondary_stores"
  end

  create_table "export_blobs", :force => true do |t|
    t.string   "checksum"
    t.text     "blob"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "export_blobs", ["checksum"], :name => "index_export_blobs_on_checksum"

  create_table "export_records", :force => true do |t|
    t.integer  "record_size"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "checksum"
    t.string   "location_pointer"
    t.string   "primary_key"
    t.integer  "export_run_id"
    t.integer  "data_source_id"
  end

  add_index "export_records", ["checksum"], :name => "index_export_records_on_checksum"
  add_index "export_records", ["location_pointer"], :name => "index_export_records_on_location_pointer"
  add_index "export_records", ["primary_key"], :name => "index_export_records_on_primary_key"

  create_table "export_runs", :force => true do |t|
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "record_count"
    t.integer  "data_source_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "duration"
  end

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
    t.string   "authentication_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
