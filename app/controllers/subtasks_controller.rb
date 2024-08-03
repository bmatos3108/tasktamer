class SubtasksController < ApplicationController
  before_action :set_task
  before_action :set_subtask, only: [:update, :destroy]

  def create
    @subtask = @task.subtasks.build(subtask_params)

    if @subtask.save
      redirect_to @task, notice: 'Subtask was successfully created.'
    else
      redirect_to @task, alert: 'Error creating subtask.'
    end
  end

  def update
    if @subtask.update(subtask_params)
      redirect_to @task, notice: 'Subtask was successfully updated.'
    else
      redirect_to @task, alert: 'Error updating subtask.'
    end
  end

  def destroy
    @subtask.destroy
    redirect_to @task, notice: 'Subtask was successfully deleted.'
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_subtask
    @subtask = @task.subtasks.find(params[:id])
  end

  def subtask_params
    params.require(:subtask).permit(:title, :description, :completed)
  end
end
