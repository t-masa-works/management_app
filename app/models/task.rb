class Task < ApplicationRecord
  validates :title, presence: true, length: {maximum: 30 }
  validates :content, presence: true
  scope :task_limit, -> {order(end_time: :desc)}
end