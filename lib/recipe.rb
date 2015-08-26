class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_many :ingredients, through: :categories

  validates :dish_name, length: { in: 2..100 }
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  
end
