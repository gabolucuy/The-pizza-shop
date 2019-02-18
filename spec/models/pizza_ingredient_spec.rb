require 'rails_helper'

RSpec.describe PizzaIngredient, type: :model do
  it { should validate_presence_of(:pizza) }
  it { should validate_presence_of(:ingredient) }
  it { should belong_to :pizza }
  it { should belong_to :ingredient }
end
