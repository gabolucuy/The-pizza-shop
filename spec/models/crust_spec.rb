require 'rails_helper'

RSpec.describe Crust, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_one :pizza }
end
