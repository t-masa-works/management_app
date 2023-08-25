class Admin::UsersController < ApplicationController
  before_action :admin_user

  def index
    @users = User.all.order(created_at: :desc)
  end

  def new

  end

  def create

  end

  def update

  end

  def destroy
    
  end

  private

  def admin_user
    redirect_to new_session_path, alert: "権限がありません" unless current_user.admin?
  end
end
