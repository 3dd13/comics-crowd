class LongerName < ActiveRecord::Migration
  def self.up
    change_column :users, :username, :string, :limit => 25
  end

  def self.down
  end
end
