class User < ApplicationRecord
  has_secure_password
  has_secure_token

  has_one :branch

  enum role: [:admin, :branch]

  delegate :id, to: :branch, prefix: true, allow_nil: true

  def invalidate_token
    update_columns token: nil
  end

  class << self
    def valid_login? email, password
      find_by(email: email.try(:downcase)).try :authenticate, password
    end
  end
end
