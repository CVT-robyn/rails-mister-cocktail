require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient_file = JSON.parse(ingredient_serialized)

ingredient = Ingredient.create(name: "#{ingredient_file['strIngredient1']}")
puts
