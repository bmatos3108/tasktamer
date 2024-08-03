class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # Displays tasks for the current user
  def index
    @tasks = current_user.tasks
  end

  # Displays tasks for the next seven days
  def next_seven_days
    @tasks_by_date = (Date.today..(Date.today + 7.days)).each_with_object({}) do |date, hash|
      hash[date] = current_user.tasks.where(due_date: date)
    end
  end

  # Shows details of a specific task
  def show
    # @task is set by before_action
  end

  # Initializes a new task
  def new
    @task = current_user.tasks.new
  end

  # Creates a new task
  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      if request.xhr? # Check if the request is an AJAX request
        render json: @task, status: :created
      else
        redirect_to @task, notice: 'Task was successfully created.'
      end
    else
      if request.xhr?
        render json: @task.errors, status: :unprocessable_entity
      else
        render :new
      end
    end
  end

  # Edits an existing task
  def edit
    # @task is set by before_action
  end

  # Updates an existing task
  def update
    if @task.update(task_params)
      if request.xhr?
        render json: @task, status: :ok
      else
        redirect_to @task, notice: 'Task was successfully updated.'
      end
    else
      if request.xhr?
        render json: @task.errors, status: :unprocessable_entity
      else
        render :edit
      end
    end
  end

  # Deletes a task
  def destroy
    @task.destroy
    if request.xhr?
      head :no_content
    else
      redirect_to tasks_path, notice: 'Task was successfully destroyed.'
    end
  end

  # Displays tasks grouped by day for the current user
  def my_tasks
    @tasks = current_user.tasks
  end

  private

  # Sets the task based on ID
  def set_task
    @task = current_user.tasks.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to tasks_path, alert: 'Task not found.'
  end

  # Strong parameters for task creation and updates
  def task_params
    params.require(:task).permit(:title, :description, :completed, :due_date, :priority, :reminder_at)
  end
end
