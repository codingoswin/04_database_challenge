require 'recipe_repository'

def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end
  
  describe RecipeRepository do
    before(:each) do 
      reset_recipes_table
    end
  
    # (your tests will go here).
  it "returns a list of all recipes" do
    recipe = RecipeRepository.new
    all_recipes = recipe.all
    expect(all_recipes.length).to eq 2
    expect(all_recipes.first.id).to eq "1"
    expect(all_recipes.first.name).to eq 'Fish & chips'
    expect(all_recipes.first.time).to eq "30"
    expect(all_recipes.first.rating).to eq "4"
  end
  it "returns a list of the 2nd element" do
    recipe = RecipeRepository.new
    all_recipes = recipe.all
    expect(all_recipes.length).to eq 2
    expect(all_recipes[1].id).to eq "2"
    expect(all_recipes[1].name).to eq 'Chicken & rice'
    expect(all_recipes[1].time).to eq "60"
    expect(all_recipes[1].rating).to eq "5"
  end
  it "returns a single recipe" do
    repo = RecipeRepository.new
    recipe = repo.find(1)
    expect(recipe.name).to eq "Fish & chips"
    expect(recipe.time).to eq "30"
    expect(recipe.rating).to eq "4"
  end
  it "returns a single recipe" do
    repo = RecipeRepository.new
    recipe = repo.find(2)
    expect(recipe.name).to eq "Chicken & rice"
    expect(recipe.time).to eq "60"
    expect(recipe.rating).to eq "5"
  end
end