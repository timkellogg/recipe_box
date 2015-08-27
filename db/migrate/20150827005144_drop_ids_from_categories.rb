class DropIdsFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :recipe_id
    remove_column :categories, :ingredient_id
  end
end
