class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
    if @project.save
      redirect_to root_path
    end
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to root_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :status, :organizer, :link)
  end
end
