class CreatePosts < ActiveRecord::Migration
  create_table :posts do |t|
    t.string :title
    t.string :category
    t.date :date
    t.text :description
    t.integer :user_id
  end
end
