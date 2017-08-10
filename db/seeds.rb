require 'json'
require 'open-uri'

p "Cleaning records..."
Ingredient.destroy_all

p "Fetching ingredients..."
url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_json = open(url).read
ingredients = JSON.parse(ingredients_json)

p "Creating ingredients..."
ingredients["drinks"].each do |i|
  Ingredient.create(name: i["strIngredient1"])
end
p "Done!"
