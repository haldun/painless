class ProjectsController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!

  expose(:projects) { current_user.projects }
  expose(:project)

  def index
    respond_with projects
  end

  def show
    respond_with project
  end

  def new
    respond_with project
  end

  def edit
    respond_with project
  end

  def create
    if project.save
      flash.notice = 'Project was successfully created.'
    end
    respond_with project
  end

  def update
    if project.save
      flash.notice = 'Project was successfully updated.'
    end
    respond_with project
  end

  def destroy
    project.destroy
    respond_with project
  end
end
