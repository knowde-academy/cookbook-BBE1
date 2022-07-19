FactoryBot.define do
  factory :rate do
    recipe
    rate { Faker::Number.between(from: 1, to: 5) }
  end
end
