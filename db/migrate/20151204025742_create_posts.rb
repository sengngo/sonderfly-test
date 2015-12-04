class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.integer :user_id, null: false
      t.integer :photo_id
      t.integer :category

      t.string :title
      t.string :intro
      t.text :body

      t.boolean :published, default: false

      t.timestamps
    end

    add_index :post, :user_id
  end
end
