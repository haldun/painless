class TasksController < ApplicationController
  respond_to :html, :json

  expose(:project)
  expose(:tasks) { project.tasks }
  expose(:task)

  def index
    respond_with tasks
  end

  def show
    respond_with task
  end

  def new
    respond_with task
  end

  def edit
    respond_with task
  end

  def create
    if task.save
      flash.notice = 'Task was successfully created.'
    end
    respond_with project
  end

  def update
    if task.save
      flash.notice = 'Task was successfully updated.'
    end
    respond_with task
  end

  def destroy
    task.destroy
    respond_with project
  end
end
