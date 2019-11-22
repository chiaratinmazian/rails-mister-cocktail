# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'


puts 'Destroying doses'
Dose.destroy_all

puts 'Destroying cocktails'
Cocktail.destroy_all

puts 'Destroy ingredients'
Ingredient.destroy_all

puts 'Create ingredients'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
repo = open(url).read
ending = JSON.parse(repo)
e = ending.flatten[1]

e.each do |ingredient|
  ingredient = Ingredient.create(name: ingredient['strIngredient1'])
  puts "create #{ingredient.name}"
end
