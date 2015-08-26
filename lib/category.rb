class Category < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe

  validates :dish_type, length: { in: 2..100 }
end
