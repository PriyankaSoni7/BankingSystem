class Account < ApplicationRecord
  belongs_to :bank
  belongs_to :user
<<<<<<< HEAD
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
=======
  has_one :creditcard
  has_many :transactions, dependent: :destroy
  validates :acc_no, :balance, :acc_type, :bank_id, :user_id, presence: true
  validates :balance, numericality: true
  validates :acc_type, inclusion: { in: %w(Saving_Account Current_Account)}
  validate :check_valid_amount, on: [:create]
  
  private

    def check_valid_amount
      if self.balance < 500.00
         errors.add(:base, "can't open an Account, Amount is less than 500")
      end
    end
end
>>>>>>> slave
