class Customer < ApplicationRecord
  VALID_UUID_REGEX = /\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  self.primary_key = :id

  belongs_to :branch
  has_many :orders

  enum gender: [:male, :female]
  enum level: [:standard, :silver, :gold]

  delegate :name, to: :branch, prefix: true

  validates :email, allow_nil: true, format: {with: VALID_EMAIL_REGEX}
  validates :name, presence: true, length: {maximum: 100}
  validates :id, format: {with: VALID_UUID_REGEX}
end
