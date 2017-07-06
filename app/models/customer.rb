class Customer < ApplicationRecord
  self.primary_key = :id

  belongs_to :branch
  has_many :orders
end
