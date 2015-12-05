class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :category_name
    	t.string :cover_photo
    	
      t.timestamps
    end
  end
end
