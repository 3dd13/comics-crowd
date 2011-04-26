class AddUsernameForUser < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string, :limit => 10
    
    add_index :users, :username, :unique => true
  end

  def self.down
    remove_column :users, :username
  end
end
