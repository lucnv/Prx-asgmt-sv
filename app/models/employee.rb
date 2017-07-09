class Employee < ApplicationRecord
  VALID_UUID_REGEX = /\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  self.primary_key = :id

  belongs_to :branch
  has_many :orders

  enum role: [:staff, :manager]
  enum gender: [:male, :female]

  delegate :name, to: :branch, prefix: true

  validates :name, presence: true, length: {maximum: 100}
  validates :email, allow_nil: true, format: {with: VALID_EMAIL_REGEX}
  validates :id, format: {with: VALID_UUID_REGEX}
end
