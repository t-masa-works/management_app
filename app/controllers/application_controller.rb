class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :login_required
  before_action :logged_in, only: [:new]

  private

  def login_required
    redirect_to new_session_path unless current_user
  end

  def logged_in
    redirect_to tasks_path(current_user) if current_user
  end

  def login_owner
    user = User.find_by(id: params[:id])
    task = Task.find_by(id: params[:id])
    if current_user != task.user && !current_user.admin
    redirect_to tasks_path, alert: "他のユーザー情報を観覧する権限がありません"
    end
  end
end
