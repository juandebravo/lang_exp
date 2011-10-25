# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.create({:username => User::GENERAL, :password => 'lang_exp', :email => 'lang_exp@tid.es'})
User.create({:username => 'robjperez', :password => 'lang_exp', :email => 'robj.perez@gmail.com'})
User.create({:username => 'juandebravo', :password => 'lang_exp', :email => 'juandebravo@gmail.com'})
User.create({:username => 'drslump', :password => 'lang_exp', :email => 'drslump@pollinimini.net'})
User.create({:username => 'rafeca', :password => 'lang_exp', :email => 'rafeca@gmail.com'})
