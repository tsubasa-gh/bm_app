class DailyWeight < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :daily_weight, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :date, presence: true, uniqueness: { scope: :user_id }
end
