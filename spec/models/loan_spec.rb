require 'rails_helper'

RSpec.describe Loan, type: :model do
  context 'loan validation' do
    it 'is a valid factory' do
      expect(FactoryBot.create(:loan)).to be_valid
    end

    it 'does not have blank user_id' do
      expect(FactoryBot.build(:loan, user_id: '')).to be_invalid
    end
    it 'is invalid without amount' do
      expect(FactoryBot.build(:loan, amount: nil)).not_to be_valid
    end
    it 'is invalid without rate' do
      expect(FactoryBot.build(:loan, int_rate: nil)).to be_invalid
    end
    it 'can only take amount in number' do
      expect(FactoryBot.build(:loan, amount: 'million')).to be_invalid
    end
    it 'can only take interest in number' do
      expect(FactoryBot.build(:loan, interest: 'three')).to be_invalid
    end
    it 'can only take time_limit in number' do
      expect(FactoryBot.build(:loan, amount: 'three year')).to be_invalid
    end

    it 'is invalid with blank type' do
      expect(FactoryBot.build(:loan, loan_type: '')).to be_invalid
    end
    it 'has valid type' do
      expect(FactoryBot.build(:loan, loan_type: 'Education_Loan')).to be_valid
    end
    it 'has valid loan_type' do
      expect(FactoryBot.build(:loan, loan_type: 'Home_Loan')).to be_valid
    end
    it 'has valid loan_type' do
      expect(FactoryBot.build(:loan, loan_type: 'Personal_loan')).to be_valid
    end
    it 'has valid loan_type' do
      expect(FactoryBot.build(:loan, loan_type: 'Business_loan')).to be_valid
    end
    it 'has valid loan_type' do
      expect(FactoryBot.build(:loan, loan_type: 'Car_Loan')).to be_valid
    end
  end
end