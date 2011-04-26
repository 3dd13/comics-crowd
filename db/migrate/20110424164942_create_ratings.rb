class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :comic_id
      t.integer :rating

      t.timestamps
    end
    
    add_index :ratings, :user_id
    add_index :ratings, :comic_id
    add_index :ratings, [:user_id, :comic_id]
  end

  def self.down
    drop_table :ratings
  end
end
