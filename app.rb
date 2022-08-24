require_relative "lib/database_connection.rb"
require_relative "lib/recipe_repository.rb"


DatabaseConnection.connect("recipes_directory_test")


recipe_repository = RecipeRepository.new
recipe_repository.all.each { |recipe| p recipe }