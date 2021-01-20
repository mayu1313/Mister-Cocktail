# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first
require 'open-uri'
puts 'Destroying data...'
Ingredient.destroy_all
puts 'Data destroyed!'
puts 'Generating new data...'

ingredients_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

serialized_ingredients = open(ingredients_url).read

ingredients = JSON.parse(serialized_ingredients)['drinks']

ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end
puts 'All data generated!'
