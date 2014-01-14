require 'test_helper'

class TaksControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @tak = taks(:one)
    @user = users(:one)
  end

  test "should get index" do
   get :index
   assert_response :success
   assert_not_nil assigns(:done)
   assert_not_nil assigns(:todo)
 end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should create tak" do
    sign_in @user
    assert_difference('Tak.count') do
      post :create, tak: { deadline: @tak.deadline, done: @tak.done, duration: @tak.duration, name: @tak.name }
    end

    assert_redirected_to taks_url
  end

test "should get edit" do
  sign_in @user
  get :edit, id: @tak
  assert_response :success
end
test "should not get edit if not logged in" do
  get :edit, id: @tak
  assert_response :redirect
end

test "should update tak" do
  sign_in @user
  patch :update, id: @tak, tak: { deadline: @tak.deadline, done: @tak.done, duration: @tak.duration, name: @tak.name }
  assert_redirected_to taks_url
end

test "should destroy tak" do
  sign_in @user
  assert_difference('Tak.count', -1) do
    delete :destroy, id: @tak
  end

  assert_redirected_to taks_path
end

end
