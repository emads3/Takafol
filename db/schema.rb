# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_31_195638) do

  create_table "cases", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "job"
    t.text "description"
    t.integer "children_num"
    t.string "marital_status"
    t.integer "priority"
    t.text "address"
    t.string "phone"
    t.integer "national_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "charities", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.text "address"
    t.string "phone_number"
    t.text "description"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_charities_on_email", unique: true
    t.index ["reset_password_token"], name: "index_charities_on_reset_password_token", unique: true
  end

  create_table "charities_cases", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "charity_id", null: false
    t.bigint "case_id", null: false
    t.index ["case_id"], name: "index_charities_cases_on_case_id"
    t.index ["charity_id"], name: "index_charities_cases_on_charity_id"
  end

  create_table "donors", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.integer "national_id", null: false
    t.string "national_id_img"
    t.text "address"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_donors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_donors_on_reset_password_token", unique: true
  end

  create_table "donors_cases", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "donor_id", null: false
    t.bigint "case_id", null: false
    t.index ["case_id"], name: "index_donors_cases_on_case_id"
    t.index ["donor_id"], name: "index_donors_cases_on_donor_id"
  end

  add_foreign_key "charities_cases", "cases"
  add_foreign_key "charities_cases", "charities"
  add_foreign_key "donors_cases", "cases"
  add_foreign_key "donors_cases", "donors"
end
