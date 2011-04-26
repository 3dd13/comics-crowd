# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
User.create! :name => 'On', :email => 'tatonlto@gmail.com', :password => '', :is_admin => true
User.create! :name => '*', :email => 'sing1708@gmail.com', :password => '', :is_admin => true 
User.create! :name => 'B', :email => 'philoman@gmail.com', :password => '', :is_admin => true