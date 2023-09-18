class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :height, presence: true, numericality: {only_integer: true, less_than: 300}
    validates :weight, presence: true, numericality: true
    validates :body_temperature, numericality: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
