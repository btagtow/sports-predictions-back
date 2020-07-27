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

ActiveRecord::Schema.define(version: 2020_07_27_223927) do

  create_table "game_selections", force: :cascade do |t|
    t.string "dateEvent"
    t.string "idAwayTeam"
    t.string "idEvent"
    t.string "idHomeTeam"
    t.string "idLeague"
    t.string "strAwayTeam"
    t.string "strEvent"
    t.string "strEventAlternate"
    t.string "strHomeTeam"
    t.string "strLeague"
    t.string "strSeason"
    t.string "strSport"
    t.string "strTime"
    t.string "correctSelection"
    t.string "selectedWinnerId"
    t.string "selectedWinnerString"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "points_allocated"
    t.index ["user_id"], name: "index_game_selections_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "betting_points"
  end

  add_foreign_key "game_selections", "users"
end
