FactoryBot.define do
  factory :order do
    pizza { create :pizza }
  end

  factory :other_dish_order, class: Order do
    other_dish { create :other_dish }
  end
end
