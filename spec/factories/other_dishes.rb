FactoryBot.define do
  factory :other_dish do
    name { Faker::Food.dish }
  end
end
