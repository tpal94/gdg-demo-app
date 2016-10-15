class User < ApplicationRecord
before_save { email.downcase! }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
has_many :posts, dependent: :destroy
validates :name, presence: true    
validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
has_secure_password
end
