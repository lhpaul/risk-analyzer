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

ActiveRecord::Schema.define(version: 20150201154008) do

  create_table "cases", force: true do |t|
    t.string "rol"
    t.string "court"
    t.string "admn_state"
    t.string "stage"
    t.string "proc"
    t.string "proc_state"
    t.date   "entry_date"
    t.string "file_link"
  end

  add_index "cases", ["rol"], name: "index_cases_on_rol"

  create_table "cases_subjects", id: false, force: true do |t|
    t.integer "subject_id"
    t.integer "case_id"
  end

  add_index "cases_subjects", ["case_id"], name: "index_cases_subjects_on_case_id"
  add_index "cases_subjects", ["subject_id"], name: "index_cases_subjects_on_subject_id"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "events", force: true do |t|
    t.integer "folio"
    t.string  "file_link"
    t.string  "stage"
    t.string  "step"
    t.text    "step_description"
    t.date    "date"
    t.integer "foja"
  end

  create_table "reports", force: true do |t|
    t.string   "name"
    t.integer  "done_jobs",  default: 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string  "name"
    t.string  "rut"
    t.string  "person_type"
    t.string  "social_reason"
    t.integer "report_id"
  end

  add_index "subjects", ["rut"], name: "index_subjects_on_rut"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
