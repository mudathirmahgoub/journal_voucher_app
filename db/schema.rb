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

ActiveRecord::Schema.define(version: 20171209045914) do

  create_table "accounts", force: :cascade do |t|
    t.integer "company_id"
    t.string "name"
    t.string "currency"
    t.decimal "currency_balance"
    t.decimal "default_balance"
    t.integer "node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_accounts_on_company_id"
    t.index ["node_id"], name: "index_accounts_on_node_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "phone_number"
    t.datetime "start_date"
    t.string "default_currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nodes", force: :cascade do |t|
    t.integer "company_id"
    t.string "name"
    t.boolean "is_editable"
    t.integer "node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_nodes_on_company_id"
    t.index ["node_id"], name: "index_nodes_on_node_id"
  end

end
