class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: { error: 'Error saving task' }, status: :unprocessable_entity
    end
  end

  # Other actions (edit, update, destroy, etc.)

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
