class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = current_user.tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :completed, :due_date, :priority, :reminder_at)
  end
end
