require_relative './recipe'

class RecipesDirectory
  def all
    recipes = []

    sql = "SELECT * FROM recipes;"
    results = DatabaseConnection.exec_params(sql, [])

    results.each do |result|
      recipe = Recipe.new

      recipe.id = result['id'].to_i
      recipe.name = result['name']
      recipe.cooking_time = result['cooking_time'].to_i
      recipe.rating = result['rating'].to_i

      recipes << recipe
    end

    return recipes
  end

  def find_by_id(id)
    sql = "SELECT * FROM recipes WHERE id = $1;"
    result = DatabaseConnection.exec_params(sql, [id])

    recipe = Recipe.new

    recipe.id = result.first['id'].to_i
    recipe.name = result.first['name']
    recipe.cooking_time = result.first['cooking_time'].to_i
    recipe.rating = result.first['rating'].to_i

    return recipe
  end
end