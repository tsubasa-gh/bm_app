class Food < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :calorie, presence: true, numericality: {greater_than: 0}
  validates :protain, numericality: {greater_than: 0}
  validates :fat, numericality: {greater_than: 0}
  validates :carbo, numericality: {greater_than: 0}
end
