class Pizza < ApplicationRecord
  belongs_to :cheese
  belongs_to :crust
  belongs_to :pizza_type
  belongs_to :sauce
  belongs_to :size
  has_many :pizza_ingredients
  has_many :ingredients, through: :pizza_ingredients
  validates_presence_of :cheese
  validates_presence_of :crust
  validates_presence_of :pizza_type
  validates_presence_of :sauce
  validates_presence_of :size

  def add_ingredient(ingredient_id)
    PizzaIngredient.create!(pizza_id:self.id,ingredient_id:ingredient_id)
  end
end
