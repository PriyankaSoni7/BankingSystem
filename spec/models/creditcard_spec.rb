require 'rails_helper'

RSpec.describe Loan, type: :model do
  context 'creditcard validation' do
    it 'is a valid factory' do
      expect(FactoryBot.create(:creditcard)).to be_valid
    end
    it 'does not have blank creditcard_id' do
      expect(FactoryBot.build(:creditcard, creditcard_id: '')).to be_invalid
    end
    it 'is invalid without expiry_date' do
      expect(FactoryBot.build(:creditcard, expiry_date: nil)).not_to be_valid
    end
    it 'is invalid without issue_date' do
      expect(FactoryBot.build(:creditcard, issue_date: nil)).to be_invalid
    end
    it 'is invalid without cash_limit' do
      expect(FactoryBot.build(:creditcard, cash_limit: nil)).to be_invalid
    end
    it 'is invalid with blank expiry_date' do
      expect(FactoryBot.build(:creditcard, expiry_date: '')).to be_invalid
    end
  end
end