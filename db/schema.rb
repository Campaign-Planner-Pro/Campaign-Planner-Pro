# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_07_07_211131) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "interest_points", force: :cascade do |t|
    t.string "name"
    t.string "interestable_type", null: false
    t.bigint "interestable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interestable_type", "interestable_id"], name: "index_interest_points_on_interestable"
  end

  create_table "nonplayer_characters", force: :cascade do |t|
    t.string "name"
    t.string "background"
    t.bigint "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_nonplayer_characters_on_campaign_id"
  end

  create_table "player_characters", force: :cascade do |t|
    t.string "name"
    t.string "background"
    t.bigint "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_player_characters_on_campaign_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.bigint "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_regions_on_campaign_id"
  end

  create_table "settlements", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.string "government"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "atmosphere"
    t.bigint "region_id", null: false
    t.index ["region_id"], name: "index_settlements_on_region_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campaigns", "users"
  add_foreign_key "nonplayer_characters", "campaigns"
  add_foreign_key "player_characters", "campaigns"
  add_foreign_key "regions", "campaigns"
  add_foreign_key "settlements", "regions"
end
