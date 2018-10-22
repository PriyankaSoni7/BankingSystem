class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :creditcard
  validates :amount, :operation, :account_id, :creditcard_id,  presence: true
  validates :amount, numericality: true
  validates :operation, inclusion: { in: %w(deposit withdrawal)}
  validate :check_amount  
  validate :withdrawal_amount_and_check_balance
  after_save :update_balance
  private

    def check_amount
      if self.amount <= 0.00 
         errors.add(:amount, "not permitted invalid amount less than zero")
        end
      end 

    def withdrawal_amount_and_check_balance
      if self.operation == "withdrawal" && self.account.balance < self.amount 
         errors.add(:amount, "withdrawal is not permitted account balance not enough")
      end
    end

    def update_balance
      if self.operation == "deposit"
         new_balance = self.account.balance + self.amount
      else
         new_balance = self.account.balance - self.amount
      end
      unless self.account.update_attributes(balance: new_balance)
          raise "request cannot be processed"
      end
    end
end
