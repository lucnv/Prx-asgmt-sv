class OrderDetail < ApplicationRecord
  self.primary_key = :id

  belongs_to :order
  belongs_to :product
end
