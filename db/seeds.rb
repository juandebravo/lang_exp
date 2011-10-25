# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.create({:username => User::GENERAL, :password => 'foobar', :email => 'lang_exp@tid.es'})
User.create({:username => 'roberto', :password => '111111', :email => 'rpc@tid.es'})
User.create({:username => 'juan', :password => '111111', :email => 'jdbd@tid.es'})
