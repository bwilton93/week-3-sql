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
    
    expect(albums.first.id).to eq "1"
    expect(albums.first.name).to eq "Pepperoni Pizza"
    expect(albums.first.cooking_time).to eq 10
    expect(albums.first.rating).to eq 5
  
    expect(albums.last.id).to eq "5"
    expect(albums.last.name).to eq "Microwave Meal"
    expect(albums.first.cooking_time).to eq 4
    expect(albums.last.rating).to eq 2
  end
end