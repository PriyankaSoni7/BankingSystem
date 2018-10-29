class Loan < ApplicationRecord
  belongs_to :user
  validates :loan_type, :amount, :int_rate, :user_id, presence: true
  validates :amount, :int_rate, numericality: true
  validates :loan_type, inclusion: { in: %w(Home_Loan Car_Loan Education_Loan PersonaL_Loan Business_Loan)}
end 