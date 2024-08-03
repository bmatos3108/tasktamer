class RemindersController < ApplicationController
  before_action :set_task
  before_action :set_reminder, only: [:show, :edit, :update, :destroy]

  def index
    @reminders = @task.reminders
  end

  def show
    # Display a single reminder
  end

  def new
    @reminder = @task.reminders.new
  end

  def create
    @reminder = @task.reminders.new(reminder_params)
    if @reminder.save
      redirect_to task_reminders_path(@task), notice: 'Reminder was successfully created.'
    else
      render :new
    end
  end

  def edit
    # Edit an existing reminder
  end

  def update
    if @reminder.update(reminder_params)
      redirect_to task_reminders_path(@task), notice: 'Reminder was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @reminder.destroy
    redirect_to task_reminders_path(@task), notice: 'Reminder was successfully destroyed.'
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_reminder
    @reminder = @task.reminders.find(params[:id])
  end

  def reminder_params
    params.require(:reminder).permit(:description, :reminder_time)
  end
end
