FactoryBot.define do
  factory :user do
  	bank_id { FactoryBot.create(:bank).id }
    name { Faker::Name.name }
    address { Faker::Address.full_address } 
    phone_no { Faker::Number.number(10) }
  
  end
end
