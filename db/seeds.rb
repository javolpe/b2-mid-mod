# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

merry_go_round = Ride.create!(name: "Merry Go Round", thrill_rating: 3, open: true)
batcoaster = Ride.create!(name: "Bat Coaster", thrill_rating: 8, open: true)
splash_mountain = Ride.create!(name: "Splash Mountain", thrill_rating: 5, open: false)
dueling_dragons = Ride.create!(name: "Dueling Dragons", thrill_rating: 9, open: true)

james = Mechanic.create!(name: "James Holden", years_experience: 4)
naomi = Mechanic.create!(name: "Naomi Nagata", years_experience: 11)
amos = Mechanic.create!(name: "Amos Burton", years_experience: 8)