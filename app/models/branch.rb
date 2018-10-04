class Branch < ApplicationRecord
	belongs_to :bank

	  validates :address, :bank_id, presence: true
end