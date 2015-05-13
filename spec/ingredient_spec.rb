require 'spec_helper'

describe(Ingredient) do
it("will belong to a specific recipe") do
  new_ingred = Ingredient.create({:name => "Lemon Grass"})
  new_recipe = Recipe.create({:name => "Tom Yum Soup"})
  new_recipe.ingredients.push(new_ingred)
  expect(new_recipe.ingredients).to(eq([new_ingred]))
end
end
