require 'bundler/setup'
Bundler.require :default, :test

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

get '/admin_recipe_box' do
  @categories = Category.all
  erb :recipe_create_form
end

get '/admin_portal' do
  @categories = Category.all
  @recipes = Recipe.all
  @ingredients = Ingredient.all
  erb :recipe_crud
end

post '/admin_portal' do
  instructions = params['instructions']
  dish_name    = params['dish_name']
  pic_link     = params['pic_link']
  rating       = params['rating'].to_i

  ingredients = params['ingredients'].split(',')
  ingredients.each do |ingredient|
    if Ingredient.find_by(item: ingredient)
      @recipe.ingredient.push(ingredient)
    else
      Ingredient.create(item: ingredient)
      @recipe.ingredient.push(ingredient)
    end
  end


  @category = Category.find(params['category'])
  @category.update({recipe_id: @recipe.id, ingredient_id: ingredient.id })

  @recipe = Recipe.create({ instructions: instructions, dish_name: dish_name, pic_link: pic_link, rating: rating })
  binding.pry
  categories = params


  erb :recipe_crud
end
