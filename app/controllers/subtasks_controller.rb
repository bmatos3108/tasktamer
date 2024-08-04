class SubtasksController < ApplicationController
  before_action :set_task

  def create
    @subtask = @task.subtasks.build(subtask_params)
    if @subtask.save
      redirect_to @task
    else
      render 'tasks/show'
    end
  end

  def update
    @subtask = @task.subtasks.find(params[:id])
    if @subtask.update(subtask_params)
      redirect_to @task
    else
      render 'tasks/show'
    end
  end

  def destroy
    @subtask = @task.subtasks.find(params[:id])
    @subtask.destroy
    redirect_to @task
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def subtask_params
    params.require(:subtask).permit(:title, :completed)
  end
end
