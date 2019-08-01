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

ActiveRecord::Schema.define(version: 2019_08_01_145708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crops", force: :cascade do |t|
    t.string "comment"
    t.float "amount"
    t.bigint "plot_id"
    t.bigint "variety_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plot_id"], name: "index_crops_on_plot_id"
    t.index ["variety_id"], name: "index_crops_on_variety_id"
  end

  create_table "farms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
  end

  create_table "plantations", force: :cascade do |t|
    t.string "comment"
    t.float "amount"
    t.bigint "plot_id"
    t.bigint "species_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plot_id"], name: "index_plantations_on_plot_id"
    t.index ["species_id"], name: "index_plantations_on_species_id"
  end

  create_table "plots", force: :cascade do |t|
    t.string "identifier"
    t.text "description"
    t.string "surface"
    t.boolean "greenhouse"
    t.bigint "farm_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farm_id"], name: "index_plots_on_farm_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string "comment"
    t.bigint "type_problem_id"
    t.bigint "plot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plot_id"], name: "index_problems_on_plot_id"
    t.index ["type_problem_id"], name: "index_problems_on_type_problem_id"
  end

  create_table "product_applications", force: :cascade do |t|
    t.string "comment"
    t.float "amount"
    t.bigint "product_id"
    t.bigint "plot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plot_id"], name: "index_product_applications_on_plot_id"
    t.index ["product_id"], name: "index_product_applications_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "composition"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_problems", force: :cascade do |t|
    t.string "name"
    t.string "scientificName"
    t.string "url"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "varieties", force: :cascade do |t|
    t.string "name"
    t.string "scientificName"
    t.string "url"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "crops", "plots"
  add_foreign_key "crops", "varieties"
  add_foreign_key "plantations", "plots"
  add_foreign_key "plantations", "species"
  add_foreign_key "problems", "plots"
  add_foreign_key "problems", "type_problems"
  add_foreign_key "product_applications", "plots"
  add_foreign_key "product_applications", "products"
end
