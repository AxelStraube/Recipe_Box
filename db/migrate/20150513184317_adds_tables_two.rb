class AddsTablesTwo < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.timestamps null: false
      t.string :instructions
    end
    create_table :categories do |t|
      t.string :name
      t.timestamps null: false
    end
    create_table :categories_recipes, id: false do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :category, index: true
    end
    create_table :ingredients do |t|
      t.string :name
      t.timestamps null: false
    end
    create_table :ingredients_recipes, id: false do |t|
      t.belongs_to :ingredient, index: true
      t.belongs_to :recipe, index: true
    end
  end
end
