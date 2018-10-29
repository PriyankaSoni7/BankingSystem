FactoryBot.define do
  factory :loan do
  	user_id { FactoryBot.create(:user).id }
    loan_type { 'Education_Loan Home_Loan Personal_loan Business_loan Car_Loan' }
    amount { Faker::Number.number(6) }
    int_rate { Faker::Number.decimal(2, 2) }
  end
end
