require_relative "./recipe"

class RecipeRepository

  def all
    # Executes the SQL query:
    sql = 'SELECT id, name, cooking_time, raiting FROM recipes';
    result_set = DatabaseConnection.exec_params(sql,[])

    recipes = []

    result_set.each do |result|
      recipe = Recipe.new
      recipe.id = result['id'].to_i
      recipe.name = result['name']
      recipe.cooking_time = result['cooking_time']
      recipe.raiting = result['raiting']

      recipes << recipe
    end

    return recipes
   end

  def find(id)
    # Executes the SQL query:
    sql = 'SELECT id, name, cooking_time, raiting FROM recipes WHERE id = $1;'
    params = [1]

    result = DatabaseConnection.exec_params(sql,params)[0]

    recipe = Recipe.new
    recipe.id = result['id'].to_i
    recipe.name = result['name']
    recipe.cooking_time = result['cooking_time'].to_i
    recipe.raiting = result['raiting'].to_i

    return recipe
  end
end