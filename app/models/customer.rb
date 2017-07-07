class Customer < ApplicationRecord
  self.primary_key = :id

  belongs_to :branch
  has_many :orders

  enum gender: [:male, :female]
  enum level: [:standard, :silver, :gold]
end
