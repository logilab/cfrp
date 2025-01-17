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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20170606185040) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "authorships", :force => true do |t|
    t.integer  "play_id"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "ext_id"
  end

  create_table "comment_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.integer  "register_id"
    t.integer  "comment_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "lagrange_authors", :force => true do |t|
    t.string   "ext_id",            :limit => 16,  :null => false
    t.string   "etype",             :limit => 32
    t.string   "birth_death_years", :limit => 64
    t.string   "mainrole",          :limit => 64
    t.string   "mainform",          :limit => 64
    t.string   "firstname",         :limit => 64
    t.string   "firstname1",        :limit => 64
    t.string   "formcompl",         :limit => 64
    t.string   "lastname",          :limit => 64
    t.string   "firstname2",        :limit => 64
    t.string   "computedform",      :limit => 128
    t.string   "url",               :limit => 128
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "lagrange_authors", ["computedform"], :name => "lagrange_authors_computedform_idx"
  add_index "lagrange_authors", ["firstname"], :name => "lagrange_authors_firstname_idx"
  add_index "lagrange_authors", ["firstname1"], :name => "lagrange_authors_firstname1_idx"
  add_index "lagrange_authors", ["firstname2"], :name => "lagrange_authors_firstname2_idx"
  add_index "lagrange_authors", ["formcompl"], :name => "lagrange_authors_formcompl_idx"
  add_index "lagrange_authors", ["lastname"], :name => "lagrange_authors_lastname_idx"
  add_index "lagrange_authors", ["mainform"], :name => "lagrange_authors_mainform_idx"
  add_index "lagrange_authors", ["mainrole"], :name => "lagrange_authors_mainrole_idx"

  create_table "lagrange_doc_authors", :force => true do |t|
    t.string   "lagrange_doc_ext_id"
    t.string   "lagrange_author_ext_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "lagrange_author_id"
    t.integer  "lagrange_doc_id"
  end

  add_index "lagrange_doc_authors", ["lagrange_author_ext_id"], :name => "lagrange_doc_authors_aut_idx"
  add_index "lagrange_doc_authors", ["lagrange_doc_ext_id"], :name => "lagrange_doc_authors_doc_idx"

  create_table "lagrange_docs", :force => true do |t|
    t.string   "ext_id",     :limit => 32,  :null => false
    t.string   "etype",      :limit => 64
    t.string   "title",      :limit => 256
    t.string   "title2",     :limit => 256
    t.string   "subtitle",   :limit => 256
    t.string   "imgref",     :limit => 128
    t.string   "imgurl",     :limit => 128
    t.string   "url",        :limit => 128
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "lagrange_docs", ["etype"], :name => "lagrange_authors_etype_idx"

  create_table "lhp_category_assignments", :force => true do |t|
    t.integer  "register_id",       :null => false
    t.integer  "page_de_gauche_id", :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "normalized_genres", :id => false, :force => true do |t|
    t.string "genre",      :limit => 64
    t.string "normalized", :limit => 64
  end

  add_index "normalized_genres", ["genre"], :name => "normalized_genres_genre_idx"
  add_index "normalized_genres", ["normalized"], :name => "normalized_genres_normalized_idx"

  create_table "page_de_gauches", :force => true do |t|
    t.string   "category",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "page_text_templates", :force => true do |t|
    t.text     "template_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participations", :force => true do |t|
    t.string   "role"
    t.integer  "person_id"
    t.boolean  "debut"
    t.string   "character"
    t.integer  "register_play_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "participations", ["person_id"], :name => "index_participations_on_person_id"
  add_index "participations", ["register_play_id"], :name => "index_participations_on_register_play_id"

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.string   "pseudonym"
    t.string   "honorific"
    t.string   "url"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "alias"
    t.string   "societaire_pensionnaire"
    t.string   "dates"
    t.integer  "birthyear"
    t.integer  "deathyear"
    t.string   "pref_label"
    t.string   "orig_label"
    t.text     "bnf_notes"
    t.integer  "ext_id"
    t.boolean  "is_actor"
    t.boolean  "is_author"
  end

  create_table "person_altlabels", :force => true do |t|
    t.integer  "ext_id"
    t.string   "label"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "person_depictions", :force => true do |t|
    t.integer  "ext_id"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "person_same_as", :force => true do |t|
    t.integer  "ext_id"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "plays", :force => true do |t|
    t.string   "author"
    t.string   "title"
    t.string   "genre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "acts"
    t.string   "prose_vers"
    t.boolean  "prologue"
    t.boolean  "musique_danse_machine"
    t.string   "alternative_title"
    t.string   "url"
    t.date     "date_de_creation"
    t.boolean  "expert_validated"
    t.integer  "_packed_id",            :null => false
  end

  create_table "rcf_lagrange_authors", :force => true do |t|
    t.string   "person_id"
    t.string   "lagrange_author_ext_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "lagrange_author_id"
    t.integer  "rcf_ext_id"
  end

  add_index "rcf_lagrange_authors", ["lagrange_author_ext_id"], :name => "rcf_lagrange_authors_lagrange_idx"
  add_index "rcf_lagrange_authors", ["person_id"], :name => "rcf_lagrange_authors_rcf_idx"

  create_table "register_contributors", :force => true do |t|
    t.integer  "register_id"
    t.integer  "task_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "register_images", :force => true do |t|
    t.string   "filepath"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "register_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "orientation"
  end

  create_table "register_period_seating_categories", :force => true do |t|
    t.integer  "register_period_id"
    t.integer  "seating_category_id"
    t.integer  "ordering",            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "register_period_seating_categories", ["register_period_id"], :name => "index_register_period_seating_categories_on_register_period_id"
  add_index "register_period_seating_categories", ["seating_category_id"], :name => "index_register_period_seating_categories_on_seating_category_id"

  create_table "register_periods", :force => true do |t|
    t.string   "period"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "register_plays", :force => true do |t|
    t.integer  "register_id"
    t.integer  "play_id"
    t.boolean  "firstrun"
    t.string   "newactor"
    t.string   "actorrole"
    t.integer  "firstrun_perfnum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ordering"
    t.boolean  "free_access"
    t.string   "ex_attendance"
    t.string   "ex_representation"
    t.string   "ex_place"
    t.boolean  "reprise"
    t.boolean  "debut"
    t.integer  "reprise_perfnum"
  end

  add_index "register_plays", ["play_id"], :name => "play_id_ix"
  add_index "register_plays", ["register_id"], :name => "register_id_ix"

  create_table "register_tasks", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registers", :force => true do |t|
    t.date     "date"
    t.string   "weekday"
    t.string   "season"
    t.integer  "register_num"
    t.text     "payment_notes"
    t.text     "page_text"
    t.integer  "total_receipts_recorded_l"
    t.integer  "total_receipts_recorded_s"
    t.integer  "representation"
    t.string   "signatory"
    t.text     "misc_notes"
    t.text     "for_editor_notes"
    t.boolean  "ouverture"
    t.boolean  "cloture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "register_image_id"
    t.integer  "register_period_id"
    t.integer  "verification_state_id"
    t.string   "irregular_receipts_name"
    t.string   "page_de_gauche"
    t.date     "date_of_left_page_info"
    t.integer  "register_images_count",      :default => 0
    t.string   "irregular_receipts_name_2"
    t.string   "irregular_receipts_name_3"
    t.string   "irregular_receipts_name_4"
    t.string   "irregular_receipts_name_5"
    t.string   "irregular_receipts_name_6"
    t.string   "irregular_receipts_name_7"
    t.string   "irregular_receipts_name_8"
    t.string   "irregular_receipts_name_9"
    t.string   "irregular_receipts_name_10"
    t.integer  "total_receipts_recorded_d"
    t.integer  "_packed_id",                                :null => false
  end

  add_index "registers", ["register_period_id"], :name => "index_registers_on_register_period_id"
  add_index "registers", ["updated_at"], :name => "registers_updated_at_ndx"
  add_index "registers", ["verification_state_id"], :name => "index_registers_on_verification_state_id"

  create_table "roles", :force => true do |t|
    t.string "name"
    t.string "description"
  end

  create_table "seating_categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "loge"
  end

  create_table "seating_category_profile", :force => true do |t|
    t.text   "profile",                                              :null => false
    t.text   "period",                                               :null => false
    t.date   "start_date",                                           :null => false
    t.date   "end_date",                                             :null => false
    t.string "seating_category_ids", :limit => nil,                  :null => false
    t.text   "category",                                             :null => false
    t.float  "estimated_seats",                     :default => 1.0
    t.text   "note"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "ticket_sales", :force => true do |t|
    t.integer  "total_sold",          :default => 0
    t.integer  "register_id",         :default => 0
    t.integer  "seating_category_id", :default => 0
    t.integer  "price_per_ticket_l",  :default => 0
    t.integer  "price_per_ticket_s",  :default => 0
    t.integer  "recorded_total_l",    :default => 0
    t.integer  "recorded_total_s",    :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price_per_ticket_d",  :default => 0
    t.integer  "recorded_total_d",    :default => 0
  end

  add_index "ticket_sales", ["register_id"], :name => "index_ticket_sales_on_register_id"
  add_index "ticket_sales", ["seating_category_id"], :name => "index_ticket_sales_on_seating_category_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "password_salt",          :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "shortname"
    t.string   "last_name"
    t.string   "first_name"
    t.text     "bio"
    t.string   "institution"
    t.string   "institution_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "reset_password_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "verification_states", :force => true do |t|
    t.string "name"
    t.string "description"
  end

  create_table "weekday_ordering", :force => true do |t|
    t.string  "name"
    t.integer "ordering"
  end

end
