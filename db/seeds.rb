# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0 
    alex = User.new(username: "Alex", password: "alex1234", email: "alex@test.com", location: "Sydney")
    alex.save(validate: false)
end 

if Category.count == 0 
    categories = ["D&D - 3", "D&D - 3.5", "D&D - 4", "D&D - 5", "Pathfinder", "Shadowrun", "Warhammer - 40k", "Warhammer - Fantasy" ]
    categories.each {|category| Category.create(name: category)}
end  
