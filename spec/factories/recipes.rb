FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    content { Faker::Food.description }
    video_link { Faker::Internet.url }
  end
end
