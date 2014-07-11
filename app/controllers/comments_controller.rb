class CommentsController < ApplicationController
  before_filter :authenticate_user, only: [:create]

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = "Successfully submitted feedback"
      redirect_to project_path(@project)
    else
      flash[:notice] = "Invalid information. Please try again"
      render template: 'post/show'
    end
  end

  private

  def authenticate_user
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
