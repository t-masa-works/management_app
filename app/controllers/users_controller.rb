class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create]

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
end
