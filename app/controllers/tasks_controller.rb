class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new

  end

  def create
    task = Task.new({
      name: params[:task][:name],
      description: params[:task][:description]
    })
    task.save

    redirect_to '/tasks'
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

end
