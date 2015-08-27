require 'bundler/setup'
Bundler.require :default, :test

require './lib/category.rb'
require './lib/ingredient.rb'
require './lib/recipe.rb'

10.times do |n|
  instructions = %w[bake boil stir chop].sample(2)
  dish_name    = ["Awesome Feast", "A Delightful treat", "Great Meal"].sample(1).to_s
  pic_link     = Faker::Avatar.image
  rating       = rand(0..5)
  published    = [false, true].sample

  @recipe = Recipe.create({ instructions: instructions, dish_name: dish_name,
            pic_link: pic_link, rating: rating, published: published })

  4.times do |j|
    ingredient = Ingredient.create({item: Faker::Lorem.sentences})
    @recipe.ingredients.push ingredient
  end

  2.times do |c|
    category = Category.new({ dish_type: Faker::Lorem.sentences})
    @recipe.categories.push category
  end
end
