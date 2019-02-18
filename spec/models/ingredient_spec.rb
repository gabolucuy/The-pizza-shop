require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it { should validate_presence_of(:name) }
end
