class OrderDetail < ApplicationRecord
  self.primary_key = :id

  belongs_to :order
  belongs_to :product

  delegate :name, to: :product, prefix: true, allow_nil: true
end
