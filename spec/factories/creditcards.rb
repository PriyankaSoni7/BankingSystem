FactoryBot.define do
  factory :user do
    card_no { Faker::Number.card_no }
    expiry_date { Faker::Number.expiry_date } 
    issue_date { Faker::Number.issue_date) }
    cash_limit { Faker::Number.between(0, 50000) }
   # branch_id { Faker::Number.number(10)}
  end
end
