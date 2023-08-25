class Admin::UsersController < ApplicationController
  before_action :admin_user
  skip_before_action :logged_in

  def index
    @users = User.all.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_admin)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
    set_admin
  end

  def update
    set_admin
    if @task.update(admin_params)
      redirect_to admin_user_path, notice: "ユーザー情報を更新しました"
     else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
     end
  end

  def destroy
    set_admin
    @user.destroy
    flash[:success] = "削除しました"
  end

  private

  def set_admin
    @user = User.find(params[:id])
  end

  def params_admin
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def admin_user
    redirect_to new_session_path, alert: "権限がありません" unless current_user.admin?
  end

end
