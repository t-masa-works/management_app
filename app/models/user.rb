class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                          format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password,  presence: true
  before_validation { email.downcase! }
  has_secure_password
  has_many :tasks, dependent: :destroy

  before_update :admin_cannot_update
  before_destroy :admin_cannot_delete

private

def admin_cannot_update
  if User.where(admin: true).count == 1 && will_save_change_to_admin? && !admin
    throw :abort
  end
end

def admin_cannot_delete
  if User.exists?(admin: true) && self.admin
    throw :abort
  end
end
end
