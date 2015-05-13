require('spec_helper')

describe(Recipe) do
  it("belongs to a specific category") do
    test_category = Category.create({:name => "Italian"})
    test_recipe = Recipe.create({:name => "Spaghetti"})
    test_category.recipes.push(test_recipe)
    expect(test_category.recipes()).to(eq([test_recipe]))
  end
end
