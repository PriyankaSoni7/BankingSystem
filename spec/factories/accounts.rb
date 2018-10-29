FactoryBot.define do
  factory :account do
  	branch_id { FactoryBot.create(:branch).id }
  	user_id { FactoryBot.create(:user).id }
    acc_no { Faker::Bank.acc_no }
    balance { Faker::Number.number(6) }
    acc_type { 'Saving_Account Current_Account' }
    acc_no { Faker::Bank.acc_no }
  end
end
