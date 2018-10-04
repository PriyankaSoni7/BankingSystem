class Account < ApplicationRecord
  belongs_to :bank
  belongs_to :user
  has_one :credit_card
  has_many :transactions, dependent: :destroy

  validates :acc_no, :balance, :acc_type, :bank_id, :user_id, presence: true
  validate :balance_limit

  before_destroy :increase_available_balance
  before_update :check_balance_have_non_zero,on: [:update]

  private

   def balance_limit
   	if self.balance < 500
   		errors.add(:balance, "balance can not be less than 500")
   	end
   end

   def increase_available_balance
    new_balance = self.transactions.amount+self.balance
    self.update_attributes(balance: new_balance)
   end

   def heck_balance_have_non_zero
     if self.balance <= 0
     	errors.add(:balance, "can not open account")
   end

end