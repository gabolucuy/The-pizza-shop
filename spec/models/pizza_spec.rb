require 'rails_helper'

RSpec.describe Pizza, type: :model do
  it { should belong_to :cheese }
  it { should belong_to :crust }
  it { should belong_to :pizza_type }
  it { should belong_to :sauce }
  it { should belong_to :size }
  it { should have_many(:pizza_ingredients) }
  it { should have_one :order }
  it { should validate_presence_of(:cheese) }
  it { should validate_presence_of(:crust) }
  it { should validate_presence_of(:pizza_type) }
  it { should validate_presence_of(:sauce) }
  it { should validate_presence_of(:size) }
end
