class CreateCoverPhotos < ActiveRecord::Migration
  def change
    create_table :cover_photos do |t|
    	t.integer :user_id
    	t.integer :post_id

    	t.text :caption

      t.timestamps
    end

    add_index :cover_photos, [:user_id, :post_id]
    add_index :cover_photos, :post_id
  end
end
