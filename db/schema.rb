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

ActiveRecord::Schema.define(version: 2018_10_23_114553) do

  create_table "activities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "price_details"
    t.text "how_to_directions"
    t.text "how_to_seats"
    t.text "activity_info"
    t.text "refund_policies"
    t.string "location_title"
    t.string "location_map"
    t.integer "my_adult_price", default: 0
    t.integer "my_child_price", default: 0
    t.integer "int_adult_price", default: 0
    t.integer "int_child_price", default: 0
    t.integer "price", default: 0
    t.boolean "is_int_price", default: false
    t.integer "full_price"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "reservations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "arrival"
    t.integer "my_adult_count", default: 0
    t.integer "my_child_count", default: 0
    t.integer "int_adult_count", default: 0
    t.integer "int_child_count", default: 0
    t.integer "total", default: 0
    t.bigint "user_id"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_reservations_on_activity_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comment"
    t.integer "star", default: 1
    t.bigint "activity_id"
    t.bigint "reservation_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_reviews_on_activity_id"
    t.index ["reservation_id"], name: "index_reviews_on_reservation_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fullname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "users"
  add_foreign_key "reservations", "activities"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "activities"
  add_foreign_key "reviews", "reservations"
end
