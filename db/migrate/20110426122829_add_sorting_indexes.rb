class AddSortingIndexes < ActiveRecord::Migration
  def self.up
    add_index :ratings, :rating
    add_index :comics, [:average_score, :rating_count]
  end

  def self.down
    remove_index :ratings, :rating
    remove_index :comics, [:average_score, :rating_count]
  end
end
