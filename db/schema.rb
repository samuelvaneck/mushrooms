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

ActiveRecord::Schema.define(version: 2020_07_11_121047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mushrooms", force: :cascade do |t|
    t.boolean "edible"
    t.string "cap_shape"
    t.string "cap_surface"
    t.string "cap_color"
    t.boolean "bruises"
    t.string "odor"
    t.string "gill_attachment"
    t.string "gill_spacing"
    t.string "gill_size"
    t.string "gill_color"
    t.string "stalk_shape"
    t.string "stalk_root"
    t.string "stalk_surface_above_ring"
    t.string "stalk_surface_below_ring"
    t.string "stalk_color_above_ring"
    t.string "stalk_color_below_ring"
    t.string "veil_type"
    t.string "veil_color"
    t.string "ring_number"
    t.string "ring_type"
    t.string "spore_print_color_range"
    t.string "population"
    t.string "habitat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
