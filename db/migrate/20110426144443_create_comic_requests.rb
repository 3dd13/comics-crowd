class CreateComicRequests < ActiveRecord::Migration
  def self.up
    create_table :comic_requests do |t|
      t.string :name
      t.string :author
      t.string :book_cover_image_url
      t.string :online_reading_website_url

      t.timestamps
    end
  end

  def self.down
    drop_table :comic_requests
  end
end
