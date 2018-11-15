class TasksController < ApplicationController

  def new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to root_path
      flash[:notice] = "Task created"
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
    flash[:notice] = "Task edited"
  end

  def index
    @tasks = Task.all
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end


  private

  def task_params
    params.permit(:title, :deadline, :description)
  end

end
