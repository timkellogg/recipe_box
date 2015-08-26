class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.column :instructions, :string
      t.column :rating, :int
      t.column :dish_name, :string, index: true 
      t.column :pic_link, :string
    end
  end
end
