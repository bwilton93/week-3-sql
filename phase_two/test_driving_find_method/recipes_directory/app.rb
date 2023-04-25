require_relative 'lib/database_connection'
require_relative 'lib/recipes_directory'

DatabaseConnection.connect('recipes_directory')

recipes_directory = RecipesDirectory.new

recipes_directory.all.each do |recipe|
  puts "#{recipe.id}. #{recipe.name.ljust(30)} - Cooking time: #{recipe.cooking_time.to_s.ljust(3)} - Rating: #{recipe.rating}"
end


p "outputting just the third entry on it's own:"
recipe = recipes_directory.find_by_id(3)
puts "#{recipe.id}. #{recipe.name.ljust(30)} - Cooking time: #{recipe.cooking_time.to_s.ljust(3)} - Rating: #{recipe.rating}"
