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

ActiveRecord::Schema.define(version: 20171204181510) do

  create_table "org_companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "avatar"
    t.text "description"
    t.string "verification_doc"
    t.boolean "verified"
    t.integer "typ_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["typ_company_id"], name: "index_org_companies_on_typ_company_id"
  end

  create_table "org_contacts", force: :cascade do |t|
    t.integer "org_comapny_id"
    t.integer "typ_country_id"
    t.integer "typ_region_id"
    t.integer "org_person_id"
    t.integer "typ_contact_id"
    t.string "address1", null: false
    t.string "address2"
    t.string "city", null: false
    t.string "postal_code", null: false
    t.string "email", null: false
    t.string "business_number", null: false
    t.string "cell_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["org_comapny_id"], name: "index_org_contacts_on_org_comapny_id"
    t.index ["org_person_id"], name: "index_org_contacts_on_org_person_id"
    t.index ["typ_contact_id"], name: "index_org_contacts_on_typ_contact_id"
    t.index ["typ_country_id"], name: "index_org_contacts_on_typ_country_id"
    t.index ["typ_region_id"], name: "index_org_contacts_on_typ_region_id"
  end

  create_table "org_people", force: :cascade do |t|
    t.integer "typ_position_id"
    t.integer "org_company_id"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "stripe_publishable_key"
    t.string "stripe_secret_key"
    t.string "stripe_user_id"
    t.string "stripe_currency"
    t.string "stripe_account_type"
    t.text "stripe_account_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_org_people_on_confirmation_token", unique: true
    t.index ["email"], name: "index_org_people_on_email", unique: true
    t.index ["org_company_id"], name: "index_org_people_on_org_company_id"
    t.index ["reset_password_token"], name: "index_org_people_on_reset_password_token", unique: true
    t.index ["typ_position_id"], name: "index_org_people_on_typ_position_id"
  end

  create_table "org_products", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.decimal "weight_in_grams", null: false
    t.decimal "price", precision: 5, scale: 2, null: false
    t.integer "available_quantity", null: false
    t.datetime "expiry_date", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.boolean "online_order_available", null: false
    t.float "tax_amoutn", default: 0.0
    t.string "image"
    t.integer "org_company_id"
    t.integer "typ_category_id"
    t.integer "typ_subcategory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["org_company_id"], name: "index_org_products_on_org_company_id"
    t.index ["typ_category_id"], name: "index_org_products_on_typ_category_id"
    t.index ["typ_subcategory_id"], name: "index_org_products_on_typ_subcategory_id"
  end

  create_table "trx_order_fees", force: :cascade do |t|
    t.float "fee_amount", null: false
    t.integer "trx_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_order_id"], name: "index_trx_order_fees_on_trx_order_id"
  end

  create_table "trx_order_items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "weight_in_grams"
    t.decimal "price"
    t.decimal "available"
    t.integer "quantity"
    t.datetime "expiry_date"
    t.string "image"
    t.integer "org_company_id"
    t.integer "org_product_id"
    t.integer "typ_category_id"
    t.integer "typ_subcategory_id"
    t.integer "trx_order_id"
    t.integer "shipping_address_id"
    t.decimal "net_amount", precision: 20, scale: 4
    t.decimal "tax_amount", precision: 20, scale: 4
    t.boolean "delivery_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["org_company_id"], name: "index_trx_order_items_on_org_company_id"
    t.index ["org_product_id"], name: "index_trx_order_items_on_org_product_id"
    t.index ["shipping_address_id"], name: "index_trx_order_items_on_shipping_address_id"
    t.index ["trx_order_id"], name: "index_trx_order_items_on_trx_order_id"
    t.index ["typ_category_id"], name: "index_trx_order_items_on_typ_category_id"
    t.index ["typ_subcategory_id"], name: "index_trx_order_items_on_typ_subcategory_id"
  end

  create_table "trx_orders", force: :cascade do |t|
    t.integer "org_company_id"
    t.integer "bill_to_contact_id"
    t.integer "ship_to_contact_id"
    t.integer "trx_order_fee_id"
    t.decimal "total_amount", precision: 20, scale: 4
    t.datetime "purchased_at"
    t.string "trasport_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_to_contact_id"], name: "index_trx_orders_on_bill_to_contact_id"
    t.index ["org_company_id"], name: "index_trx_orders_on_org_company_id"
    t.index ["ship_to_contact_id"], name: "index_trx_orders_on_ship_to_contact_id"
    t.index ["trx_order_fee_id"], name: "index_trx_orders_on_trx_order_fee_id"
  end

  create_table "typ_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "typ_companies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "typ_contacts", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "typ_countries", force: :cascade do |t|
    t.string "iso"
    t.string "iso3"
    t.string "country"
    t.string "continent"
    t.string "cuurency_code"
    t.string "currency_name"
    t.string "phone_prefix_string"
    t.string "postal_code"
    t.string "languages"
    t.string "geonameid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "typ_fees", force: :cascade do |t|
    t.string "name"
    t.float "fee_percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "typ_positions", force: :cascade do |t|
    t.string "name", null: false
    t.integer "typ_country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["typ_country_id"], name: "index_typ_positions_on_typ_country_id"
  end

  create_table "typ_regions", force: :cascade do |t|
    t.string "name"
    t.string "timezone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "typ_sales_taxes", force: :cascade do |t|
    t.string "name", null: false
    t.integer "typ_region_id"
    t.integer "typ_tax_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["typ_region_id"], name: "index_typ_sales_taxes_on_typ_region_id"
    t.index ["typ_tax_id"], name: "index_typ_sales_taxes_on_typ_tax_id"
  end

  create_table "typ_sub_categories", force: :cascade do |t|
    t.string "name"
    t.integer "typ_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["typ_category_id"], name: "index_typ_sub_categories_on_typ_category_id"
  end

  create_table "typ_taxes", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
