class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new

  end

  def create
    # task = Task.new({
    #   name: params[:task][:name],
    #   description: params[:task][:description]
    # })
    # task.save   #old code without strong params
    Task.create(task_params)

    redirect_to '/tasks'
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update({
      name: params[:task][:name],
      description: params[:task][:description]
    })
    task.save

    redirect_to '/tasks'
  end

  def destroy
    Task.destroy(params[:id])
    
    redirect_to '/tasks'
  end


  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

end
