FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    content { Faker::Food.description }
    price { Faker::Number.number(digits: 2) }
    cooking_time { Faker::Number.number(digits: 2) }
  end
end
