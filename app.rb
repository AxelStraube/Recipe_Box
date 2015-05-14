require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
also_reload('lib/**/*.rb')
require('./lib/category')
require('./lib/ingredient')
require('./lib/recipe')
require('pg')
require('pry')

get ('/') do
  @all_categories = Category.all()
  erb(:index)
end

get ('/categories/new') do
  erb(:category_form)
end

post ('/categories') do
  name = params.fetch("name")
  new_category = Category.create({:name => name})
  @all_categories = Category.all()
  erb(:index)
end

get ('/categories/:id') do
  @category = Category.find(params.fetch("id").to_i())
  @recipes = @category.recipes
  @all_ingredients = Ingredient.all()
  erb(:category)
end

post ('/recipes') do
  name = params.fetch("name")
  instructions = params.fetch("instructions")
  new_recipe = Recipe.create({:name => name, :instructions => instructions})
  category_id = params.fetch("category_id").to_i()
  @category = Category.find(category_id)
  @category.recipes.push(new_recipe)
  @recipes = @category.recipes
  erb(:category)
end

get ('/recipes/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  erb(:recipe)
end

get ('/ingredients/new') do
  @all_ingredients = Ingredient.all()
  erb(:ingredient_form)
end

post ('/ingredients/new') do
  name = params.fetch("name")
  ingredient = Ingredient.create({:name => name})
  @all_ingredients = Ingredient.all()
  erb(:ingredient_form)
end
