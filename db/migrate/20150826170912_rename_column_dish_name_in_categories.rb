class RenameColumnDishNameInCategories < ActiveRecord::Migration
  def change
    rename_column :categories, :dish_name, :dish_type
  end
end
