require 'json'
require 'open-uri'

puts 'Cleaning database...'
Ingredient.destroy_all
puts 'Creating database...'


url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient_file = JSON.parse(ingredient_serialized)

ingredients = ingredient_file['drinks']

ingredients.each do |ingredient|
  i = Ingredient.create(name: ingredient['strIngredient1'])
end

puts 'Seed Done'
