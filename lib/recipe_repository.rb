require_relative 'recipe'

class RecipeRepository
    def all
        sql = "SELECT id, name, time, rating FROM recipes;"
        result_set = DatabaseConnection.exec_params(sql, [])
        
        recipes = []
        
        result_set.each do |record|
        recipe = Recipe.new
        recipe.id = record["id"]
        recipe.name = record["name"]
        recipe.time = record["time"]
        recipe.rating = record["rating"]
        recipes << recipe
        end
        return recipes
    end

    def find(id)
        sql = 'SELECT name, time, rating FROM recipes WHERE id = $1;'
        params = [id]
    
        result = DatabaseConnection.exec_params(sql, params)
        record = result[0]
    
        recipe = Recipe.new
        recipe.id = record['id']
        recipe.name = record['name']
        recipe.time = record['time']
        recipe.rating = record['rating']   
        return recipe
    end
end