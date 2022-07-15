FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    content { Faker::Food.description }
    price { Faker::Number.number(digits: 2) }
    video_link { Faker::Internet.url }
    cooking_time { Faker::Number.number(digits: 2) }

  end
end
