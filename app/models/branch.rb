class Branch < ApplicationRecord
  has_many :customers
  has_many :orders
  has_many :employees
  has_many :branch_products
  has_many :synchronization_logs
  belongs_to :user
end
