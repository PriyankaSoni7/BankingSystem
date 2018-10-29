require 'rails_helper'

RSpec.describe Bank, type: :model do
  context 'Bank validation' do
    it 'has valid factory' do
      expect(FactoryBot.build(:bank)).to be_valid
    end
    it 'is invalid without name' do
      expect(FactoryBot.build(:bank, name: nil)).to be_invalid
    end
    it 'is invalid without address' do
      expect(FactoryBot.build(:bank, address: nil)).not_to be_valid
    end
  end
end