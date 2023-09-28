class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :height, presence: true, numericality: {only_integer: true, less_than: 300}
    validates :weight, presence: true, numericality: true
    validates :body_temperature, numericality: true, allow_blank: true
    validates :sex, presence: true, numericality: true
    validates :age, presence: true, numericality: {only_integer: true, less_than: 100}
    validates :goal_weight, presence: true, numericality: true
    validates :purpose, presence: true, numericality: true
    validates :activity_level, presence: true, numericality: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    # 渡された文字列のハッシュ値を返す 
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
