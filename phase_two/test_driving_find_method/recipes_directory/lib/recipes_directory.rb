require_relative './recipe'

class RecipesDirectory
  def all
    recipes = []

    sql = "SELECT * FROM recipes;"
    results = DatabaseConnection.exec_params(sql, [])

    results.each do |result|
      recipe = Recipe.new

      recipe.id = result['id']
      recipe.name = result['name']
      recipe.cooking_time = result['cooking_time'].to_i
      recipe.rating = result['rating'].to_i

      recipes << recipe
    end

    return recipes
  end
end