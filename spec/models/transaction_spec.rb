require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'Transaction validation' do
    it 'has valid factory' do
      expect(FactoryBot.build(:transaction)).to be_valid
    end
    it 'is invalid without a account' do
      expect(FactoryBot.build(:transaction, account_id: nil)).to be_invalid
    end
    it 'is invalid without operation' do
      expect(
        FactoryBot.build(:transaction, operation: nil)
      ).to be_invalid
    end
    it 'is invalid to has zero amount' do
      expect(FactoryBot.build(:transaction, amount: '0')).to be_invalid
    end
    it 'is invalid to has less then zero amount' do
      expect(FactoryBot.build(:transaction, amount: '-100')).to be_invalid
    end
    it 'has valid operation' do
      expect(
        FactoryBot.build(:transaction, operation: 'withdrawal')
      ).to be_valid
    end
    it 'has valid operation' do
      expect(
        FactoryBot.build(:transaction, operation: 'deposite')
      ).to be_valid
    end
    it 'is invalid without valid condition' do
      @a = FactoryBot.create(:account, balance: '1000')

      @t = FactoryBot.build(
        :transaction,
        operation: 'withdraw',
        amount: '4000',
        account_id: @a.id
      )

      expect(@t).to be_invalid
    end
    it 'is update balance after withdrawal' do
      @a = FactoryBot.create(:account, balance: '1000')
      @t = FactoryBot.create(
        :transaction,
        operation: 'withdraw',
        amount: '500',
        account_id: @a.id
      )
      @left = @a.balance - @t.amount
      expect(@t.account.balance).to eq(@left)
    end
    it 'is update balance after deposit ' do
      @a = FactoryBot.create(:account, balance: '1000')
      @t = FactoryBot.create(
        :transaction,
        operation: 'deposit',
        amount: '500',
        account_id: @a.id
      )
      @left = @a.balance + @t.amount
      expect(@t.account.balance).to eq(@left)
    end
  end
end