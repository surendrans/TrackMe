require 'test_helper'

class UserRequestDetailsControllerTest < ActionController::TestCase
  setup do
    @user_request_detail = user_request_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_request_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_request_detail" do
    assert_difference('UserRequestDetail.count') do
      post :create, :user_request_detail => @user_request_detail.attributes
    end

    assert_redirected_to user_request_detail_path(assigns(:user_request_detail))
  end

  test "should show user_request_detail" do
    get :show, :id => @user_request_detail.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user_request_detail.to_param
    assert_response :success
  end

  test "should update user_request_detail" do
    put :update, :id => @user_request_detail.to_param, :user_request_detail => @user_request_detail.attributes
    assert_redirected_to user_request_detail_path(assigns(:user_request_detail))
  end

  test "should destroy user_request_detail" do
    assert_difference('UserRequestDetail.count', -1) do
      delete :destroy, :id => @user_request_detail.to_param
    end

    assert_redirected_to user_request_details_path
  end
end
