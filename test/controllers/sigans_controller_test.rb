require 'test_helper'

class SigansControllerTest < ActionController::TestCase
  setup do
    @sigan = sigans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sigans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sigan" do
    assert_difference('Sigan.count') do
      post :create, sigan: { body: @sigan.body, gwamokid: @sigan.gwamokid, title: @sigan.title, username: @sigan.username }
    end

    assert_redirected_to sigan_path(assigns(:sigan))
  end

  test "should show sigan" do
    get :show, id: @sigan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sigan
    assert_response :success
  end

  test "should update sigan" do
    patch :update, id: @sigan, sigan: { body: @sigan.body, gwamokid: @sigan.gwamokid, title: @sigan.title, username: @sigan.username }
    assert_redirected_to sigan_path(assigns(:sigan))
  end

  test "should destroy sigan" do
    assert_difference('Sigan.count', -1) do
      delete :destroy, id: @sigan
    end

    assert_redirected_to sigans_path
  end
end
