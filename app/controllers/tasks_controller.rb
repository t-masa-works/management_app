class TasksController < ApplicationController
  skip_before_action :logged_in, only:[:new]
  before_action :login_owner, only: [:show]

  def index
    @tasks = Task.all.order(created_at: :desc)

    if params[:task_limit]
      @tasks = Task.task_limit
    end
    if params[:user_tasks]
      @tasks = current_user.tasks
    end
    if params[:rank]
      @tasks = Task.rank
    end
    if params[:task].present?
      if params[:task][:search].present? && params[:task][:status].present?
        @tasks = @tasks.task_and_status(params[:task][:search], params[:task][:status])
      end
      if params[:task][:search].present?
        @tasks = @tasks.with_title(params[:task][:search])
      end
      if params[:task][:status].present?
        @tasks = @tasks.with_status(params[:task][:status])
      end
      if params[:task][:tag_id].present?
        @tasks = Tag.find(params[:task][:tag_id]).tasks
      end
    end
    @tasks = @tasks.page(params[:page]).per(5)
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to task_path(@task), notice: "保存に成功しました"
    else
      flash.now[:danger] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    set_task
  end

  def update
    set_task
      if @task.update(task_params)
        redirect_to tasks_path, notice: "タスクを更新しました"
      else
        flash.now[:danger] = '更新に失敗しました'
        render :edit
      end
  end

  def show
    set_task
  end

  def destroy
    set_task
    @task.destroy
    flash[:success] = "削除しました"
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(%i[title content end_time status priority user_id tag_name], tag_ids: [])
  end

  def login_owner
    task = Task.find(params[:id])
      if current_user != task.user && !current_user.admin
      redirect_to tasks_path, alert: "他のユーザー情報を観覧する権限がありません"
      end
  end

end
