class OrderDetail < ApplicationRecord
  VALID_UUID_REGEX = /\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/

  self.primary_key = :id

  belongs_to :order
  belongs_to :product

  delegate :name, to: :product, prefix: true, allow_nil: true

  validates :id, format: {with: VALID_UUID_REGEX}
end
