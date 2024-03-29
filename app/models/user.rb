class User < ApplicationRecord
    attr_accessor :remember_token
    has_many :foods, dependent: :destroy
    has_many :daily_records, dependent: :destroy
    has_many :daily_weights, dependent: :destroy

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
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    # 渡された文字列のハッシュ値を返す 
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # ランダムなトークンを返す
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    # 永続的セッションのためにユーザーをデータベースに記憶する
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
        remember_digest
    end

    # セッションハイジャック防止のためにセッショントークンを返す
    # この記憶ダイジェストを再利用しているのは単に利便性のため
    def session_token
        remember_digest || remember
    end

    # 渡されたトークンがダイジェストと一致したらtrueを返す
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # ユーザーのログイン情報を破棄する
    def forget
        update_attribute(:remember_digest, nil)
    end
end
