FactoryBot.define do
  factory :branch do
  	bank_id { FactoryBot.create(:bank).id }
    address { Faker::Address.full_address }
end
