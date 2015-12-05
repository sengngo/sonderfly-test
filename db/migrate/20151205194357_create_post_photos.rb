class CreatePostPhotos < ActiveRecord::Migration
  def change
    create_table :post_photos do |t|
    	t.integer :user_id
    	t.integer :post_id

    	t.text :caption

      t.timestamps
    end

    add_index :post_photos, [:user_id, :post_id]
    add_index :post_photos, :post_id
  end
end