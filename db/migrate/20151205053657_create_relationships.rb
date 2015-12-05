class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
    	t.integer :relationship_id
    	t.integer :leader_id
    	t.integer :follower_id

      t.timestamps
    end

    add_index :relationships, :follower_id
    add_index :relationships, :leader_id
    add_index :relationships, [:follower_id, :leader_id], unique: true
  end
end
