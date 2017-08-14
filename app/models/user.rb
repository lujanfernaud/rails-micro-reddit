class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true,
                       length: { in: 3..16 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    confirmation: true

  validates :email_confirmation, presence: true

  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  has_secure_password
end
