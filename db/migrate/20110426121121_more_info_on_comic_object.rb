class MoreInfoOnComicObject < ActiveRecord::Migration
  def self.up
    add_column :comics, :average_score, :decimal, :precision => 3, :scale => 1
    add_column :comics, :rating_count, :integer
    add_column :comics, :is_finished, :boolean
  end

  def self.down
    remove_column :comics, :average_score
    remove_column :comics, :rating_count
    remove_column :comics, :is_finished
  end
end
