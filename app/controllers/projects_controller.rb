class ProjectsController < ApplicationController
	before_action :authenticate_user!
	def index
		@projects = Project.all
		def create
			@project = Project.new(project_params)
			if !@project.save
				render action: 'error'
			end
			def destroy
				@project = Project.find(params[:id])
				@project.destroy
			end
		end
	end
end
private
def project_params
	params.require(:project).permit(:name)
end 
