require 'rails_helper'

RSpec.describe Branch, type: :model do
  context 'branch validations' do
    it 'has a valid factory' do
      branch = FactoryBot.build(:branch)
      expect(branch).to be_valid
    end
    it 'is invalid to has  address nil' do
      expect(FactoryBot.build(:branch, address: nil)).to be_invalid
    end
    it 'is invalid without bank' do
      expect(FactoryBot.build(:branch, bank_id: nil)).to be_invalid
    end
  end
end