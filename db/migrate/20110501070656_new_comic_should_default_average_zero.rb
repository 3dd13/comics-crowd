class NewComicShouldDefaultAverageZero < ActiveRecord::Migration
  def self.up
    change_column :comics, :average_score, :decimal, :precision => 3, :scale => 1, :default => 0.0, :null => false
    change_column :comics, :rating_count, :integer, :default => 0, :null => false
  end

  def self.down
  end
end
