class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.column :item, :string, index: true 
    end
  end
end
