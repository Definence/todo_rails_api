class TasksController < ApplicationController
  # замінили на expose
  # виконує перед контролерами [] сет таск
  # before_action :set_task, only: [:show, :update, :destroy]

  expose :task, -> { current_user.tasks.find(params[:id]) }
  expose :tasks, -> { current_user.tasks.all }


  def index
    # tasks = current_user.tasks.all
    if tasks
      # render json: tasks, status: 200
      render_api(tasks, :ok, each_serializer: TasksSerializer)
    else
      return head(:bad_request)
    end
  end

  def show
    if task
      # render json: task, status: 200
      render json: task, each_serializer: TaskSerializer, status: 200
    else
      return head(:bad_request)
    end
  end

  def create
    task = current_user.tasks.new(task_params)
    if task.save
      # render json: task, status: :created, location: task
      render json: task, each_serializer: TaskSerializer, status: :created
    else
      return head(:bad_request)
    end
  end

  def update
    if task.update(task_params)
      # render json: task
      render json: task, each_serializer: TaskSerializer
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if task.destroy
      return head(:ok)
    else
      return head(:bad_request)
    end
  end

  def batch_destroy
    if current_user.tasks.where(id: params[:ids]).destroy_all
      return head(:ok)
    else
      return head(:bad_request)
    end
  end

  private

  # замінили на expose
  # def set_task
  #   замінив на expose(:task)
  #   @id = params[:id]
  #   @task = current_user.tasks.find(@id)

  #   # для масиву ід
  #   if @id && @id.kind_of?(Array)
  #     # назначає в таски в перемінну. where = find(in plural)
  #     @tasks = current_user.tasks.where(id: @id)
  # end

  def task_params
    params.require(:task).permit(:title, :description, :priority, :active, :due_date)
  end
end
