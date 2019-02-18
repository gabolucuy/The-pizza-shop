require 'rails_helper'

RSpec.describe PizzaType, type: :model do
  it { should validate_presence_of(:name) }
end
