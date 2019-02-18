require 'rails_helper'

RSpec.describe OtherDish, type: :model do
  it { should have_one :order }
  it { should validate_presence_of(:name) }

end
