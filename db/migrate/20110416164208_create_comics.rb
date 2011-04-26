class CreateComics < ActiveRecord::Migration
  def self.up
    create_table :comics do |t|
      t.string :name
      t.string :author
      t.string :book_cover_image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :comics
  end
end
