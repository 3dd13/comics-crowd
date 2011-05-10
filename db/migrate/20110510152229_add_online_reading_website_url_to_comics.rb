class AddOnlineReadingWebsiteUrlToComics < ActiveRecord::Migration
  def self.up
    add_column :comics, :online_reading_website_url, :string, :default => '', :null => false
  end

  def self.down
    remove_column :comics, :online_reading_website_url, :string, :default => '', :null => false
  end
end
