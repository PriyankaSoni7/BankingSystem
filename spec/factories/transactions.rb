FactoryBot.define do
  factory :transaction do
    creditcard_id { FactoryBot.create(:creditcard).id }
    account_id { FactoryBot.create(:account).id }
    amount { Faker::Number.number(2) }
    operation { %w[deposite withdrawal].sample }
  end
end
