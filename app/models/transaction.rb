class Transaction < ApplicationRecord
<<<<<<< HEAD
	belongs_to :account
    belongs_to :credit_card

    validates :amount, :acc_id, :credit_card_id,  presence: true
    after_save :withdrawal_amount_and_check_balance
    after_save :update_balance_after_deposit
    after_save :left_balance_after_withdrawal

    private

    def withdrawal_amount_and_check_balance
    if self.account.balance < self.amount && self.operation == 'withdrawal'
      errors.add(:amount, "not permitted amount,not balance enough")
    end
  end  

  def update_balance_after_deposite
    if self.operation == 'deposit'
      new_balance = self.account.balance + self.amount
      self.account.update.attributes(balance: new_balance)
    end
  end

  def left_balance_after_withdrawal
    if self.operation == 'withdrawal'    
      new_balance = self.account.balance - self.amount
      unless self.account.update_attributes(balance: new_balance)
      raise "amount can not be withdraw"
    end
  end
=======
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
>>>>>>> slave
end
