class Bank < ApplicationRecord
   has_many :users, dependent: :destroy
   has_many :branches, dependent: :destroy
   has_many :accounts, dependent: :destroy
   validates :name, :address, presence: true
   
end
