class Employee < ApplicationRecord
  self.primary_key = :id

  belongs_to :branch
  has_many :orders

  enum role: [:staff, :manager]
  enum gender: [:male, :female]

  delegate :name, to: :branch, prefix: true
end
