class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(created_at: :desc)

    if params[:task_limit]
      @tasks = Task.task_limit
    elsif params[:rank]
      @tasks = Task.rank
    elsif params[:task] && params[:task][:search].present? && params[:task][:status].present?
      @tasks = Task.task_and_status(params[:task][:search], params[:task][:status])
    elsif params[:task].present? && params[:task][:search].present?
      @tasks = Task.with_title(params[:task][:search])
    elsif params[:task].present? && params[:task][:status].present?
      @tasks = Task.with_status(params[:task][:status])
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
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
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :end_time, :status, :priority)
  end

end
