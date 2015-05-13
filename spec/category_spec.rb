require 'spec_helper'

describe(Category) do
  it("contains specific recipes") do
    new_category = Category.create({:name => "Thai"})
    new_recipe = Recipe.create({:name => "Green Curry"})
    new_recipe.categories.push(new_category)
    expect(new_recipe.categories()).to(eq([new_category]))
  end
end
