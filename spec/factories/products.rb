FactoryBot.define do
  factory :product do
    name { Faker::Food.fruits }
    quantity { Faker::Number.number(digits: 2) }
  end
end
