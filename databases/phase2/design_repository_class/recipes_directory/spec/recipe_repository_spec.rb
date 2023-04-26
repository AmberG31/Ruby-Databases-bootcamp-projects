require "recipe_repository"

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory' })
  connection.exec(seed_sql)
end

describe RecipeRepository do

  before(:each) do 
    reset_recipes_table
  end

  it "#all returns all recipes" do
    repo = RecipeRepository.new
    recipes = repo.all

    expect(recipes.length).to eq 2
    expect(recipes[0].id).to eq 1
    expect(recipes[0].name).to eq 'Stake'
    expect(recipes[0].cooking_time).to eq '10'
    expect(recipes[0].raiting).to eq '4'

    expect(recipes[1].id).to eq 2
    expect(recipes[1].name).to eq 'Soup'
    expect(recipes[1].cooking_time).to eq '30'
    expect(recipes[1].raiting).to eq '4.5'

  end

  it "#find returns Stake when given id is 1" do
    repo = RecipeRepository.new
    recipe = repo.find(1)

    expect(recipe.id).to eq 1
    expect(recipe.name).to eq 'Stake'
    expect(recipe.cooking_time).to eq 10
    expect(recipe.raiting).to eq 4
  end
  
  # works when the parameter is amended to 2.
  # it "#find returns Soup when given id is 2" do
  #   repo = RecipeRepository.new
  #   recipe = repo.find(2)

  #   expect(recipe.id).to eq 2
  #   expect(recipe.name).to eq 'Soup'
  #   expect(recipe.cooking_time).to eq 30
  #   expect(recipe.raiting).to eq 4.5
  # end

end
