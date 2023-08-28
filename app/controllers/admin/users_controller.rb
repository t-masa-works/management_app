class Admin::UsersController < ApplicationController
  before_action :admin_user
  skip_before_action :logged_in

  def index
    @users = User.all.order(created_at: :desc).page(params[:page]).per(10)
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
    if @user.update(params_admin)
      flash[:success] = "ユーザー情報を更新しました"
    elsif User.where(admin: true).count == 1 && !@user.admin
      flash[:alert] = "管理者が最後の１人のため、権限を変更できません"
    else
      flash[:danger] = '更新に失敗しました'
    end
    redirect_to admin_users_path
  end

  def destroy
    set_admin
    if @user.destroy
      flash[:success] = "削除しました"
    elsif User.exists?(admin: true) && @user.admin
      flash[:alert] = "管理者が最後の１人のため、削除できません"
    else
      flash[:alert] = "削除に失敗しました"
    end
    redirect_to admin_users_path
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
