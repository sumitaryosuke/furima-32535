FactoryBot.define do
  factory :post_fee do
    post_fee_id {Faker::Number.between(from: 1, to: 3)}
  end
end
