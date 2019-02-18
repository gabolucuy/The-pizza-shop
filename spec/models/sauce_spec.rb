require 'rails_helper'

RSpec.describe Sauce, type: :model do
  it { should validate_presence_of(:name) }
end
