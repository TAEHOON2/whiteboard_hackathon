require 'test_helper'

class SchedulerControllerTest < ActionController::TestCase
  test "should get tt" do
    get :tt
    assert_response :success
  end

end
