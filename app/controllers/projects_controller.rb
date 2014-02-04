class ProjectsController < ApplicationController
	before_action :authenticate_user!
  def index
  @projects = Project.all
  def create
  @project = Project.new(project_params)
  @project.save
	end
	end
end
private
    def project_params
      params.require(:project).permit(:name)
    end 
