ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'pg'
require 'sinatra/activerecord'
require 'recipe'
require 'ingredient'
require 'category'

RSpec.configure do |config|
  config.after(:each) do
    Recipe.all().each() do |recipe|
      recipe.destroy()
    end
    Ingredient.all().each do |ingredient|
      ingredient.destroy()
    end
    Category.all().each do |category|
      category.destroy()
    end
  end
end
