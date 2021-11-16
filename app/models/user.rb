class User < ApplicationRecord
  before_save { self.email = self.email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
      # let to use hashed password and password_confirmation as variable, not in db
      # let to use authenticate method

  validates :password, presence: true, length: {minimum: 6}
end
