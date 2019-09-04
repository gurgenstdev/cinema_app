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

ActiveRecord::Schema.define(version: 2019_09_04_102711) do

  create_table "auditoriums", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "theater_id"
    t.index ["theater_id"], name: "index_auditoriums_on_theater_id"
  end

  create_table "movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rating"
    t.string "genre"
    t.integer "duration"
  end

  create_table "theater_movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "theater_id", null: false
    t.bigint "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_theater_movies_on_movie_id"
    t.index ["theater_id"], name: "index_theater_movies_on_theater_id"
  end

  create_table "theaters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "address"
    t.string "phone_number"
  end

  add_foreign_key "theater_movies", "movies"
  add_foreign_key "theater_movies", "theaters"
end
