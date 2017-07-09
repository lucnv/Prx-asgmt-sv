class Branch < ApplicationRecord
  has_many :customers
  has_many :orders
  has_many :employees
  has_many :branch_products
  has_many :synchronization_logs
  belongs_to :user

  validates :name, :address, presence: true, length: {maximum: 100}
end
