class Order < ApplicationRecord
  self.primary_key = :id

  belongs_to :branch
  belongs_to :employee
  belongs_to :customer
  has_many :order_details
end
