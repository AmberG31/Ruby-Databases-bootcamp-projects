require_relative "lib/database_connection"
require_relative "lib/recipe_repository"
require_relative "lib/recipe"

DatabaseConnection.connect("recipes_directory")

recipe_repository = RecipeRepository.new

recipe_repository.all.each do |recipe|
  p "#{recipe.name} cooking time is #{recipe.cooking_time}. The raiting is #{recipe.raiting}"
end

puts "-----------------"
recipe = recipe_repository.find(1)
puts recipe.name
puts recipe.cooking_time
puts recipe.raiting
