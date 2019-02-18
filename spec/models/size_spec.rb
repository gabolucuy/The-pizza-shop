require 'rails_helper'

RSpec.describe Size, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slices) }
  it { should have_one :pizza }
  
end
