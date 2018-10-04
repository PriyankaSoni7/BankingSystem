class CreditCard < ApplicationRecord
  belongs_to :account
  has_many :transactions

  validates :card_no, :expiry_date, :issue_date, :cash_limit, :account_id , presence: true
  validates :card_no, length: { is: 10 }, numericality: { only_integer: true }
  validate :max_cash_limit
  validate :credit_card_expired, on: [:create]

  private

   def max_cash_limit
   	if self.cash_limit > 50000
   		errors.add(:cash_limit, "card limit exceeds 50000")
   	end
   end

   def credit_card_expired
    if self.expiry_date < Date.today 
      errors.add(:base, "transactions can not be done becoz card is expitred")
    end
  end

end
