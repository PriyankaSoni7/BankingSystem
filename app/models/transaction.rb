class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :creditcard
  validates :amount, :operation, :account_id, :creditcard_id,  presence: true
  validates :amount, numericality: true
  validates :operation, inclusion: { in: %w(deposit withdrawal)}
  validate :amount_validate
  validate :amount_limit
  after_save :balance_after_withdraw
  after_save :balance_after_deposit

  private

  def amount_validate
    errors.add(:amount, 'invailid amount') if amount.nil? || amount <= 0
  end

  def amount_limit
    errors.add(:amount, 'insufficient balance') if
    operation == 'withdrawal' && (account && amount > account.balance)
  end

  def balance_after_withdraw
    left_balance = account.balance - amount
    account.update_attributes(balance: left_balance) if
    operation == 'withdrawal'
  end

  def balance_after_deposit
    new_balance = account.balance + amount
    account.update_attributes(balance: new_balance) if
    operation == 'deposit'
  end
end