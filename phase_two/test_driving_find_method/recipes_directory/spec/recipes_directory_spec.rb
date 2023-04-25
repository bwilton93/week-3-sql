require 'recipes_directory'

def reset_recipes_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end
  
describe RecipesDirectory do
  before(:each) do 
    reset_recipes_table
  end

  it "fetches all recipes" do
    repo = RecipesDirectory.new

    recipes = repo.all
    expect(recipes.length).to eq 5
    
    expect(recipes.first.id).to eq 1
    expect(recipes.first.name).to eq "Pepperoni Pizza"
    expect(recipes.first.cooking_time).to eq 10
    expect(recipes.first.rating).to eq 5
  
    expect(recipes.last.id).to eq 5
    expect(recipes.last.name).to eq "Microwave Meal"
    expect(recipes.last.cooking_time).to eq 4
    expect(recipes.last.rating).to eq 2
  end

  it "fetches a single recipe by ID" do
    repo = RecipesDirectory.new

    recipe = repo.find_by_id(3)

    expect(recipe.id).to eq 3
    expect(recipe.name).to eq "Choriza and Broccoli Pasta"
    expect(recipe.cooking_time).to eq 15
    expect(recipe.rating).to eq 5
  end
end