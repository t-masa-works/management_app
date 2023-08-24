class Admin::UsersController < ApplicationController
  before_action :admin_user

  def index
    @users = User.all.order(created_at: :desc)
  end

  private

  def admin_user
    redirect_to new_session_path unless current_user.admin?
  end
end
