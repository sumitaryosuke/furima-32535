FactoryBot.define do
  factory :order_address do
    postal_code   { 1_234_567.to_s.insert(3, '-') }
    area_id       { Faker::Number.between(from: 1, to: 47) }
    city          { Faker::Address.city }
    block         { Faker::Address.building_number }
    phone_number  { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
