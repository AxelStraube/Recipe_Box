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
  erb(:category)
end

get ('/categories/:id/recipes/new') do
#  @category = Category.find(params.fetch("id").to_i())
  erb(:recipe_form)
end

post ('/recipes') do
  name = params.fetch("name")
  new_recipe = Recipe.create({:name => name})
  @category = Category.find(params.fetch("id").to_i())
  # @category = Category.find('category_id').to_i()
  # @recipes = @category.recipes
  erb(:category)
end
