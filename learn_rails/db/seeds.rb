# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |n|
  prices  = format("%.2f", rand(1.95...2.95))
  latitudes = format("%.2f", rand(35.5...38.5))
  longitudes = format("%.2f", rand(120.0...124.0)*(-1))

  Gasstation.create!(prices: prices, latitudes: latitudes, longitudes: longitudes)
end
  