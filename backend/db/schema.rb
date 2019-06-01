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

ActiveRecord::Schema.define(version: 2019_05_29_213247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "goods", force: :cascade do |t|
    t.string "name"
    t.string "shelf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.bigint "good_id"
    t.bigint "recipe_id"
    t.float "quantity_amount"
    t.string "quantity_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_id"], name: "index_ingredients_on_good_id"
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "menu_goods", force: :cascade do |t|
    t.bigint "good_id"
    t.bigint "menu_id"
    t.integer "quantity"
    t.integer "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_id"], name: "index_menu_goods_on_good_id"
    t.index ["menu_id"], name: "index_menu_goods_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shopping_id"
    t.datetime "eat_at"
    t.index ["shopping_id"], name: "index_menus_on_shopping_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "season"
    t.integer "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shoppings", force: :cascade do |t|
    t.datetime "purchased_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ingredients", "goods"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "menu_goods", "goods"
  add_foreign_key "menu_goods", "menus"
  add_foreign_key "menus", "shoppings"
end
