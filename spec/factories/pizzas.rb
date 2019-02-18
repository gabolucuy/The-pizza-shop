FactoryBot.define do
  factory :pizza do
    cheese { create :cheese }
    crust { create :crust }
    pizza_type { create :pizza_type }
    sauce { create :sauce }
    size { create :size }
  end
end
