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
end
