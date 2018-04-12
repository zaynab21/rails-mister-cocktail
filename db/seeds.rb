require 'open-uri'
require 'json'

Ingredient.destroy_all

ingredients = JSON.parse(open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)
ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end


# ingredients = JSON.parse(File.read('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'))


Cocktail.destroy_all
puts "cocktail destroyed"

Cocktail.create!(name:"Mojito")
