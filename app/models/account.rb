class Account < ApplicationRecord
  belongs_to :bank
  belongs_to :user
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
