class ProjectsController < ApplicationController
	before_action :authenticate_user!
	def index
		@projects = Project.all
		def create
			@project = Project.new(project_params)
			if !@project.save
				render action: 'error'
			end
		end
	end
end
private
def project_params
	params.require(:project).permit(:name)
end 
