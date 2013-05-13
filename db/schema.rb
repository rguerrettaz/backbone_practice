ActiveRecord::Schema.define(:version => 20130423033144) do

  create_table "tutorials", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "votes", :force => true do |t|
    t.string   "vote_type"
    t.integer  "voter_id"
    t.integer  "tutorial_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
