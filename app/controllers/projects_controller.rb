class ProjectsController < ApplicationController
  before_filter :authenticate_user, only: [:new]
  include ApplicationHelper

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @comment = Comment.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to root_path
    end
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

  def status
    @project = Project.find(params[:project_id])
    @project.send(params[:info][:status])
    if @project.save
      redirect_to root_path
    end
  end

  private

  def authenticate_user
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def project_params
    params.require(:project).permit(:name, :description, :organizer, :link, :short_description)
  end
end
