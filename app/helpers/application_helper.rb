module ApplicationHelper
  def format_time(project)
    project.created_at.strftime("%b %d, %Y")
  end
end
