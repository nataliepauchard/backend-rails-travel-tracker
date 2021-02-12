# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
u1 = User.create name: 'Nat P', :email => 'natp@ga.co', :password => '123', :admin => true
u2 = User.create name: 'Dani B', :email => 'danib@ga.co', :password => '123', :admin => true
u3 = User.create name: 'Scott C', :email => 'scottc@ga.co', :password => '123', :admin => true
u4 = User.create name: 'Jye H', :email => 'jyeh@ga.co', :password => 'chicken'
puts "#{ User.count } users."
