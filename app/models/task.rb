class Task < ApplicationRecord
  validates :title, presence: true, length: {maximum: 30 }
  validates :content, presence: true
  validates :status, presence: true
  scope :task_limit, -> {order(end_time: :desc)}
  enum status: { not_started: 0, in_progress: 1, completed: 2 }

end