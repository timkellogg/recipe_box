class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.column :recipe_id, :int
      t.column :ingredient_id, :int
      t.column :dish_name, :varchar
    end
  end
end
