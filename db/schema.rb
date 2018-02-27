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

ActiveRecord::Schema.define(version: 20180217234627) do

  create_table "bet_leagues", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bets", force: :cascade do |t|
    t.integer "game_id"
    t.integer "player_id"
    t.integer "player_score"
    t.integer "bet_league_id"
    t.integer "home_bet"
    t.integer "visitor_bet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "championships", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "home_id"
    t.integer "visitor_id"
    t.integer "home_score"
    t.integer "visitor_score"
    t.datetime "date_time"
    t.integer "championship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_bet_leagues", force: :cascade do |t|
    t.integer "player_id"
    t.integer "bet_league_id"
    t.integer "player_accumulated_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
