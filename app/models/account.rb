class Account < ApplicationRecord
  belongs_to :bank
  belongs_to :user
  has_one :credit_card
  has_many :transactions, dependent: :destroy

  validates :acc_no, :balance, :acc_type, :bank_id, :user_id, presence: true
  validate :balance_limit

  private

   def balance_limit
   	if self.balance < 500
   		errors.add(:balance, "balance can not be less than 500")
   	end
   end

end
