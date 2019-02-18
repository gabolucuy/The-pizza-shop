class Ingredient < ApplicationRecord
  validates_presence_of :name
  has_many :pizza_ingredients
  
end
