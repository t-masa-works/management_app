class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create]
  before_action :login_owner, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    set_user
    @task = @user.tasks.order(priority: :desc).page(params[:page]).per(5)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(%i[name email password password_confirmation])
  end

  def login_owner
    user = User.find(params[:id])
      if current_user != user && !current_user.admin
      redirect_to tasks_path, alert: "他のユーザー情報を観覧する権限がありません"
      end
  end
end
