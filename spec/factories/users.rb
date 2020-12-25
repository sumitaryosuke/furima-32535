FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'aaa111' }
    password_confirmation { password }
    last_name { '姓' }
    first_name { '名' }
    last_name_kana { 'セイ' }
    first_name_kana { 'メイ' }
    birth_day { '1999-01-01' }
  end
end
