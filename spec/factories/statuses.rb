FactoryBot.define do
  factory :status do
    status_id { Faker::Number.between(from: 1, to: 7) }
  end
end
