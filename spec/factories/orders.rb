FactoryBot.define do
  factory :order do

    association :user
    association :item
    association :address
  
  end
end
