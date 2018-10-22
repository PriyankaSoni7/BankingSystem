class User < ApplicationRecord
  belongs_to :bank
  has_one :account, dependent: :destroy
  has_many :loans, dependent: :destroy
<<<<<<< HEAD

  validates :name, :address, :phone_no, :bank_id, presence: true
  validates :phone_no, length: { is: 10 }, numericality: { only_integer: true }
end
=======
  validates :name, :address, :phone_no, :bank_id, presence: true
  validates :phone_no, uniqueness: true, length: { is: 10 }, numericality: { only_integer: true }
end
>>>>>>> slave
