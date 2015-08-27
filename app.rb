require 'bundler/setup'
Bundler.require :default, :test

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

# after { ActiveRecord::Base.connection.close }

get '/' do
  @recipes = []
  @recipes_highly_rated = []

  Recipe.all.each do |recipe|
    if recipe.published
      @recipes.push(recipe)
    end
    if recipe.rating > 3
      @recipes_highly_rated.push(recipe)
    end
  end

  @recipes
  @recipes_highly_rated
  erb :index
end

get '/categories' do
  @categories = Category.all
  erb :categories
end

get '/recipes/:id' do
  @recipe = Recipe.find(params['id'])
  erb :recipe
end

get '/categories/:id' do
  @category = Category.find(params['id'])
  @recipes  = @category.recipes
  erb :category
end

get '/ingredients' do
  @ingredients = Ingredient.all
  erb :ingredients
end

get '/ingredients/:id' do
  @ingredient = Ingredient.find(params['id'])
  @recipes = @ingredient.recipes
  erb :ingredient
end

### admin portal
get '/admin/recipes/new' do
  @categories = Category.all
  erb :recipe_create_form
end

get '/admin/recipes' do
  @categories = Category.all
  @recipes = Recipe.all
  @ingredients = Ingredient.all
  erb :admin_recipes
end

post '/admin/recipes' do
  instructions = params['instructions']
  dish_name    = params['dish_name']
  pic_link     = params['pic_link']
  rating       = params['rating'].to_i
  published    = params['published']

  if published == 't'
    published = true
  else
    published = false
  end

  ingredients  = params['ingredients'].split(',')

    # begin
    @recipe      = Recipe.create({ instructions: instructions, dish_name: dish_name, pic_link: pic_link, rating: rating, published: published })
    categories   = params['category'].split(',')

    categories.each do |category_name|
      category = Category.find_or_create_by(dish_type: category_name)
      @recipe.categories.push(category)
    end

    ingredients.each do |ingredient|
      if Ingredient.find_by({ item: ingredient })
        ingredient = Ingredient.find_by({ item: ingredient })
      else
        ingredient = Ingredient.create({ item: ingredient })
      end
      @recipe.ingredients.push(ingredient)
    end

    @recipes = Recipe.all
    @categories = Category.all
    erb :admin_recipes
  # rescue => e
    # redirect "/admin/recipes/new"
  # end
end

get '/admin/recipes/:id' do
  @recipe = Recipe.find(params['id'])
  erb :admin_recipe
end

get '/admin/recipes/:id/edit' do
  @recipe = Recipe.find(params['id'])
  @ingredients = ''
  @categories  = ''

  @recipe.ingredients.each { |ingredient| @ingredients += ingredient.item }
  @recipe.categories.each  { |category| @categories += category.dish_type }
  @ingredients
  @categories
  erb :recipe_edit_form
end

patch '/admin/recipes/:id' do

  begin
    instructions = params['instructions']
    dish_name    = params['dish_name']
    pic_link     = params['pic_link']
    rating       = params['rating'].to_i
    ingredients  = params['ingredients'].split(',')
    published    = params['published']
    categories   = params['category'].split(',')

    if published == 't'
      published = true
    else
      published = false
    end

    @recipe = Recipe.find(params['id'])

    @recipe.update({ instructions: instructions, dish_name: dish_name,
                     pic_link: pic_link, rating: rating, published: published })

    @recipe.update({})
    categories.each do |category_name|
      category = Category.find_or_create_by(dish_type: category_name)
      @recipe.update({:category_ids => category.id})
    end

    ingredients.each do |ingredient|
      ingredient = Ingredient.find_or_create_by(item: ingredient)
      @recipe.update({:ingredient_ids => ingredient.id})
      # @recipe.ingredients.push(ingredient)
    end

    erb :admin_recipe
  rescue => e
    redirect "/admin/recipes/#{@recipe.id}"
  end
end

get '/admin/recipes/:id/delete' do
  @recipe = Recipe.find(params['id'])
  if @recipe.delete
    redirect '/admin/recipes'
  else
    redirect "/admin/recipes/#{@recipe.id}"
  end
end
