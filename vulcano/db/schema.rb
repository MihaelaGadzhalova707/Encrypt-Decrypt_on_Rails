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

ActiveRecord::Schema.define(version: 20180108182114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "create_decrypteds", force: :cascade do |t|
    t.string "decrypted"
    t.integer "id_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "create_encrypteds", force: :cascade do |t|
    t.string "encrypted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "id_message"
  end

  create_table "rsas", force: :cascade do |t|
    t.string "encrypted"
    t.string "decrypted"
    t.integer "n"
    t.integer "e"
    t.integer "d"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
