# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150812194109) do

  create_table "conferences", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.datetime "date"
    t.string   "locationname",   limit: 255
    t.string   "locationstreet", limit: 255
    t.integer  "locationnumber", limit: 4
    t.string   "locationcity",   limit: 255
    t.integer  "locationzip",    limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.date     "fiscal_year"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "registrant_id",                    limit: 4
    t.integer  "conference_id",                    limit: 4
    t.integer  "po_id",                            limit: 4
    t.integer  "organization_id",                  limit: 4
    t.integer  "invoice_number",                   limit: 4
    t.datetime "date"
    t.text     "service_provided",                 limit: 65535
    t.integer  "lineitem_id",                      limit: 4
    t.integer  "accounting_code",                  limit: 4
    t.integer  "department_id",                    limit: 4
    t.integer  "accounts_payable_organization_id", limit: 4
    t.integer  "terms",                            limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", limit: 4,     null: false
    t.integer  "application_id",    limit: 4,     null: false
    t.string   "token",             limit: 255,   null: false
    t.integer  "expires_in",        limit: 4,     null: false
    t.text     "redirect_uri",      limit: 65535, null: false
    t.datetime "created_at",                      null: false
    t.datetime "revoked_at"
    t.string   "scopes",            limit: 255
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id", limit: 4
    t.integer  "application_id",    limit: 4
    t.string   "token",             limit: 255, null: false
    t.string   "refresh_token",     limit: 255
    t.integer  "expires_in",        limit: 4
    t.datetime "revoked_at"
    t.datetime "created_at",                    null: false
    t.string   "scopes",            limit: 255
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",         limit: 255,                null: false
    t.string   "uid",          limit: 255,                null: false
    t.string   "secret",       limit: 255,                null: false
    t.text     "redirect_uri", limit: 65535,              null: false
    t.string   "scopes",       limit: 255,   default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "buildingname",      limit: 255
    t.string   "address",           limit: 255
    t.string   "city",              limit: 255
    t.integer  "zip",               limit: 4
    t.integer  "telephone",         limit: 4
    t.string   "kind",              limit: 255
    t.string   "department_fields", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "proposals", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "firstname",  limit: 255
    t.string   "lastname",   limit: 255
    t.string   "abstract",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "registrants", force: :cascade do |t|
    t.string   "firstname",      limit: 255
    t.string   "lastname",       limit: 255
    t.string   "middleinitial",  limit: 255
    t.integer  "homenumber",     limit: 4
    t.string   "homestreet",     limit: 255
    t.string   "homecity",       limit: 255
    t.string   "homestate",      limit: 255
    t.integer  "homezip",        limit: 4
    t.string   "homephone",      limit: 255
    t.string   "cellphone",      limit: 255
    t.string   "businessname",   limit: 255
    t.integer  "businessnumber", limit: 4
    t.string   "businessstreet", limit: 255
    t.string   "businesscity",   limit: 255
    t.string   "businessstate",  limit: 255
    t.integer  "businesszip",    limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "conference_id",  limit: 4
    t.boolean  "presenter",      limit: 1
    t.boolean  "keynote",        limit: 1
    t.boolean  "legislator",     limit: 1
  end

  create_table "sessions", force: :cascade do |t|
    t.integer  "presenterid",    limit: 4
    t.integer  "copresenter_id", limit: 4
    t.integer  "conferenceid",   limit: 4
    t.string   "title",          limit: 255
    t.string   "description",    limit: 255
    t.datetime "starttime"
    t.datetime "endtime"
    t.string   "strand",         limit: 255
    t.integer  "roomid",         limit: 4
    t.integer  "level",          limit: 4
    t.integer  "setuporderid",   limit: 4
    t.string   "language",       limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "proposal_id",    limit: 255
  end

  create_table "tokens", force: :cascade do |t|
    t.string   "access_token",  limit: 255
    t.string   "refresh_token", limit: 255
    t.datetime "expires_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
