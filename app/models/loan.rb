class Loan < ApplicationRecord
  belongs_to :user
  
  validates :loan_type, :amount, :int_rate, :user_id, presence: true
end