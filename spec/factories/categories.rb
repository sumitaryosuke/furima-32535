FactoryBot.define do
  factory :category do
    category_id {Faker::Number.between(from: 1, to: 11)}
  end
end
