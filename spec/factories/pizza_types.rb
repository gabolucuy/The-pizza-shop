FactoryBot.define do
  factory :pizza_type do
    name { Faker::Food.dish }
  end
end
