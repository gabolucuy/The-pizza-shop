FactoryBot.define do
  factory :pizza_ingredient do
    pizza { create :pizza }
    ingredient { create :ingredient }
  end
end
