class TasksController < ApplicationController
  # виконує перед контролерами [] сет таск
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    tasks = current_user.tasks.all
    if tasks
      render json: tasks, status: 200
    else
      return head(:bad_request)
    end
  end

  def show
    if @task
      render json: @task, status: 200
    else
      return head(:bad_request)
    end
  end

  def create
    task = current_user.tasks.new(task_params)
    if task.save
      render json: task, status: :created, location: task
    else
      return head(:bad_request)
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @task.destroy
      return head(:ok)
    else
      return head(:bad_request)
    end
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :priority, :active, :due_date)
  end
end
