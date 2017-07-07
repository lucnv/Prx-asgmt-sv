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

ActiveRecord::Schema.define(version: 20170707025159) do

  create_table "branch_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "branch_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id", "product_id"], name: "index_branch_products_on_branch_id_and_product_id", unique: true, using: :btree
  end

  create_table "branches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "working_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "description", limit: 65535
  end

  create_table "customers", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "id",                       null: false
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "gender"
    t.string   "phone_number"
    t.string   "address"
    t.integer  "point",        default: 0
    t.integer  "level"
    t.integer  "branch_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["id"], name: "index_customers_on_id", unique: true, using: :btree
  end

  create_table "employees", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "id",           null: false
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "gender"
    t.string   "phone_number"
    t.string   "address"
    t.integer  "role"
    t.integer  "branch_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["id"], name: "index_employees_on_id", unique: true, using: :btree
  end

  create_table "order_details", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "id",                    null: false
    t.string   "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.float    "unit_price", limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["id"], name: "index_order_details_on_id", unique: true, using: :btree
  end

  create_table "orders", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "id",                     null: false
    t.string   "customer_id"
    t.string   "employee_id"
    t.datetime "time"
    t.float    "total_price", limit: 24
    t.integer  "branch_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["id"], name: "index_orders_on_id", unique: true, using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "category_id"
    t.float    "price",       limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "description", limit: 65535
  end

end
