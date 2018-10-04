class User < ApplicationRecord
  belongs_to :bank
  has_one :account, dependent: :destroy
  has_many :loans, dependent: :destroy

  validates :name, :address, :phone_no, :bank_id, presence: true
  validates :phone_no, length: { is: 10 }, numericality: { only_integer: true }
end
