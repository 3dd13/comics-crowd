require 'test_helper'

class ComicRequestsControllerTest < ActionController::TestCase
  setup do
    @comic_request = comic_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comic_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comic_request" do
    assert_difference('ComicRequest.count') do
      post :create, :comic_request => @comic_request.attributes
    end

    assert_redirected_to comic_request_path(assigns(:comic_request))
  end

  test "should show comic_request" do
    get :show, :id => @comic_request.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @comic_request.to_param
    assert_response :success
  end

  test "should update comic_request" do
    put :update, :id => @comic_request.to_param, :comic_request => @comic_request.attributes
    assert_redirected_to comic_request_path(assigns(:comic_request))
  end

  test "should destroy comic_request" do
    assert_difference('ComicRequest.count', -1) do
      delete :destroy, :id => @comic_request.to_param
    end

    assert_redirected_to comic_requests_path
  end
end
