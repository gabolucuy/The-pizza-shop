require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to :pizza }
  it { should belong_to :other_dish }
end
