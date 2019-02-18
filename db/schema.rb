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

ActiveRecord::Schema.define(version: 2019_02_18_044129) do

  create_table "cheeses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crusts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "other_dishes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pizza_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pizzas", force: :cascade do |t|
    t.integer "cheese_id"
    t.integer "crust_id"
    t.integer "pizza_type_id"
    t.integer "sauce_id"
    t.integer "size_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cheese_id"], name: "index_pizzas_on_cheese_id"
    t.index ["crust_id"], name: "index_pizzas_on_crust_id"
    t.index ["pizza_type_id"], name: "index_pizzas_on_pizza_type_id"
    t.index ["sauce_id"], name: "index_pizzas_on_sauce_id"
    t.index ["size_id"], name: "index_pizzas_on_size_id"
  end

  create_table "sauces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.integer "slices"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
