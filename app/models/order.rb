class Order < ApplicationRecord
  VALID_UUID_REGEX = /\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/

  self.primary_key = :id

  belongs_to :branch
  belongs_to :employee
  belongs_to :customer
  has_many :order_details

  scope :recent_created, ->{order created_at: :desc}

  delegate :name, to: :branch, prefix: true, allow_nil: true
  delegate :name, to: :customer, prefix: true, allow_nil: true
  delegate :name, to: :employee, prefix: true, allow_nil: true

  validates :id, format: {with: VALID_UUID_REGEX}
end
