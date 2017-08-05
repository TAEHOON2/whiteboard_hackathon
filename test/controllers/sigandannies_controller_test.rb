require 'test_helper'

class SigandanniesControllerTest < ActionController::TestCase
  setup do
    @sigandanny = sigandannies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sigandannies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sigandanny" do
    assert_difference('Sigandanny.count') do
      post :create, sigandanny: { userid10: @sigandanny.userid10, userid1: @sigandanny.userid1, userid2: @sigandanny.userid2, userid3: @sigandanny.userid3, userid4: @sigandanny.userid4, userid5: @sigandanny.userid5, userid6: @sigandanny.userid6, userid7: @sigandanny.userid7, userid8: @sigandanny.userid8, userid9: @sigandanny.userid9 }
    end

    assert_redirected_to sigandanny_path(assigns(:sigandanny))
  end

  test "should show sigandanny" do
    get :show, id: @sigandanny
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sigandanny
    assert_response :success
  end

  test "should update sigandanny" do
    patch :update, id: @sigandanny, sigandanny: { userid10: @sigandanny.userid10, userid1: @sigandanny.userid1, userid2: @sigandanny.userid2, userid3: @sigandanny.userid3, userid4: @sigandanny.userid4, userid5: @sigandanny.userid5, userid6: @sigandanny.userid6, userid7: @sigandanny.userid7, userid8: @sigandanny.userid8, userid9: @sigandanny.userid9 }
    assert_redirected_to sigandanny_path(assigns(:sigandanny))
  end

  test "should destroy sigandanny" do
    assert_difference('Sigandanny.count', -1) do
      delete :destroy, id: @sigandanny
    end

    assert_redirected_to sigandannies_path
  end
end
