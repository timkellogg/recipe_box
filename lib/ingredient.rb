class Ingredient < ActiveRecord::Base
  has_many :recipes
  has_many :recpies, through: :categories
end
