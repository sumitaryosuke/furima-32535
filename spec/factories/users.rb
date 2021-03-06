FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'test123TEST' }
    password_confirmation { password }
    last_name { '姓' }
    first_name { '名' }
    last_name_kana { 'セイ' }
    first_name_kana { 'メイ' }
    birth_day { '1999-01-01' }

    # association :item
    # association :order
  end
end
