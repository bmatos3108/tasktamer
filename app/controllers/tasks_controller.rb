class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
    @notes = Note.where(task_id: @task.id)
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: { error: 'Error saving task' }, status: :unprocessable_entity
    end
  end

  def create_reminder
    @reminder = @task.reminders.new(reminder_params)
    if @reminder.save
      redirect_to @task, notice: 'Reminder was successfully created.'
    else
      redirect_to @task, alert: 'Failed to create reminder.'
    end
  end

  def destroy_reminder
    @reminder = @task.reminders.find(params[:id])
    @reminder.destroy
    redirect_to @task, notice: 'Reminder was successfully deleted.'
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
