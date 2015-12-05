class CreateProfilePhotos < ActiveRecord::Migration
  def change
    create_table :profile_photos do |t|
    	t.integer :user_id

      t.timestamps
    end
    add_index :profile_photos, :user_id
  end
end
