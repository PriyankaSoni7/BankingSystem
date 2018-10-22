class Branch < ApplicationRecord
<<<<<<< HEAD
	belongs_to :bank

	  validates :address, :bank_id, presence: true
=======
  belongs_to :bank
  validates :address, :bank_id, presence: true
>>>>>>> slave
end
