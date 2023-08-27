class TasksController < ApplicationController
  skip_before_action :logged_in, only:[:new]

  def index
    @tasks = Task.all.order(created_at: :desc).page(params[:page]).per(10)

    if params[:task_limit]
      @tasks = current_user.tasks.task_limit.page(params[:id]).per(10)
    elsif params[:user_tasks]
      @tasks = current_user.tasks.page(params[:page]).per(10)
    elsif params[:rank]
      @tasks = current_user.tasks.rank.page(params[:page]).per(10)
    elsif params[:task] && params[:task][:search].present? && params[:task][:status].present?
      @tasks = current_user.tasks.task_and_status(params[:task][:search], params[:task][:status]).page(params[:page]).per(10)
    elsif params[:task].present? && params[:task][:search].present?
      @tasks = current_user.tasks.with_title(params[:task][:search]).page(params[:page]).per(10)
    elsif params[:task].present? && params[:task][:status].present?
      @tasks = current_user.tasks.with_status(params[:task][:status]).page(params[:page]).per(10)
    end
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
    params.require(:task).permit(%i[title content end_time status priority user_id])
  end

end
