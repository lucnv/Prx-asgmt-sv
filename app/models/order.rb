class Order < ApplicationRecord
  self.primary_key = :id

  belongs_to :branch
  belongs_to :employee
  belongs_to :customer
  has_many :order_details

  scope :recent_created, ->{order created_at: :desc}

  delegate :name, to: :branch, prefix: true, allow_nil: true
  delegate :name, to: :customer, prefix: true, allow_nil: true
  delegate :name, to: :employee, prefix: true, allow_nil: true
end
