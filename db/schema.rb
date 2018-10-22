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

ActiveRecord::Schema.define(version: 2018_10_17_172821) do

  create_table "accounts", force: :cascade do |t|
    t.string "acc_no"
    t.integer "balance"
    t.string "acc_type"
    t.integer "bank_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_accounts_on_bank_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "branches", force: :cascade do |t|
    t.string "address"
    t.integer "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_branches_on_bank_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.integer "card_no"
    t.date "expiry_date"
    t.date "issue_date"
    t.integer "cash_limit"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_credit_cards_on_account_id"
  end

  create_table "creditcards", force: :cascade do |t|
    t.integer "card_no"
    t.date "expiry_date"
    t.date "issue_date"
    t.integer "cash_limit"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_creditcards_on_account_id"
  end

  create_table "loans", force: :cascade do |t|
    t.string "loan_type"
    t.integer "amount"
    t.integer "int_rate"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "amount"
    t.string "operation"
    t.integer "credit_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_card_id"], name: "index_transactions_on_credit_card_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_no"
    t.integer "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_users_on_bank_id"
  end

end
