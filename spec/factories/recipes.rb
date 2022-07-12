FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    content { Faker::Food.description }
    price { Faker::Number.number(digits: 5)}
  end
end
