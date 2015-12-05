class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.integer :user_id, null: false
      t.integer :category_id

      t.string :title
      t.string :intro
      t.text :body

      t.boolean :published, default: false
      t.boolean :private, default: false

      t.timestamps
    end

    add_index :posts, :user_id
    add_index :posts, :category_id
  end
end
