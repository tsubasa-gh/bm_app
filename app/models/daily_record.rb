class DailyRecord < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :total_calorie, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :total_protain, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :total_fat, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :total_carbo, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :date, presence: true
end
