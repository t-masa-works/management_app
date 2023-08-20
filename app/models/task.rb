class Task < ApplicationRecord
  validates :title, presence: true, length: {maximum: 30 }
  validates :content, presence: true
  validates :status, presence: true
  enum status: { not_started: 0, in_progress: 1, completed: 2 }

  scope :task_limit, -> {order(end_time: :desc)}
  scope :with_title, -> (title) {where('title LIKE ?', "%#{title}%")}
  scope :with_status, -> (status) {where(status: status)}
  scope :task_and_status, -> (title, status) {with_title(title).with_status(status)}

end