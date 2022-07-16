FactoryBot.define do
  factory :comment do
    recipe
    author { Faker::Name.name }
    body { Faker::ChuckNorris.fact }
  end
end
