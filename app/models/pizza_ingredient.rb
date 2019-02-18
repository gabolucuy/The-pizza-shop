class PizzaIngredient < ApplicationRecord
  belongs_to :pizza
  belongs_to :ingredient
  validates_presence_of :pizza,:ingredient
end
