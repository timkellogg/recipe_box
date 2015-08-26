require 'spec_helper'

describe Category do

  # before { @category = Category.create({ dish_y }) }
  # validations
  it 'returns false if the dish_type is too short' do
    category = Category.new({ dish_type: 'a', ingredient_id: 1, recipe_id: 1})
    expect(category.save).to eq false
  end
end
