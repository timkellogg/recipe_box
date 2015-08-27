class Category < ActiveRecord::Base
  has_and_belongs_to_many :recipes

  before_save down_case
  validates :dish_type, uniqueness: true

  private

    def down_case
      dish_type.downcase!
    end
end
