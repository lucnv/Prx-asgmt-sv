class SynchronizationLog < ApplicationRecord
  belongs_to :branch

  enum status: [:failed, :success]

  scope :recent_created, ->{order created_at: :desc}

  delegate :name, to: :branch, prefix: true, allow_nil: true
end
