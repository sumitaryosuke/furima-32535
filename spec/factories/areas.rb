FactoryBot.define do
  factory :area do
    area_id {Faker::Number.between(from: 0, to: 47)}
  end
end
