class TasksController < ApplicationController

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

end
