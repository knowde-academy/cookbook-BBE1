FactoryBot.define do
  factory :comment do
    author { Faker::Name.name }
    body { Faker::ChuckNorris.fact }
    recipe
  end
end
