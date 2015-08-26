require 'spec_helper'

describe Recipe do

  # it 'returns false if the length is greater than 100 or less than 2' do
  #   recipe = Recipe.new({instructions: 'put the lime in the coconut', rating: 1, dish_name: 'c', pic_link: 'www.coco.com'})
  #   expect(recipe.save).to eq false
  # end
  #
  # it 'returns false if integer is a number' do
  #   recipe = Recipe.new({instructions: 'put the lime in the coconut', rating: 'bob', dish_name: 'coco-lime', pic_link: 'www.coco.com'})
  #   expect(recipe.save).to eq false
  # end
  #
  # it 'returns false if rating is less than 0' do
  #   recipe = Recipe.new({instructions: 'put the lime in the coconut', rating: -1, dish_name: 'coco-lime', pic_link: 'www.coco.com'})
  #   expect(recipe.save).to eq false
  # end
  #
  # it 'returns false if rating is greater than 5' do
  #   recipe = Recipe.new({instructions: 'put the lime in the coconut', rating: 6, dish_name: 'coco-lime', pic_link: 'www.coco.com'})
  #   @ingredient = Ingredient.create({ item: 'new ingredient '})
  #   recipe.ingredients.push(@ingredient)
  #   expect(recipe.save).to eq false
  # end
  #
  # it 'returns false if rating is not an integer' do
  #   recipe = Recipe.new({instructions: 'put the lime in the coconut', rating: 6.092034, dish_name: 'coco-lime', pic_link: 'www.coco.com'})
  #   expect(recipe.save).to eq false
  # end

  describe '#ingredients' do
    it 'returns the ingredients of the recipe' do
      @recipe = Recipe.create({instructions: 'put the lime in the coconut', rating: 1, dish_name: 'csdf', pic_link: 'www.coco.com'})
      @ingredient = Ingredient.create({ item: 'strawberries '})
      binding.pry
      @recipe.ingredients.push(@ingredient)
      expect(@recipe.ingredients).to eq @ingredient
    end
  end

end
