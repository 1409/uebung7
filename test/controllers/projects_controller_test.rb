require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
	include Devise::TestHelpers

	setup do
		@project = taks(:one)
		@user = users(:one)
	end
	test "should get index" do
		sign_in @user
		get :index
		assert_response :success
	end

end
