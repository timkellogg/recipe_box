class Category < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  validates :dish_type, uniqueness: true
end
