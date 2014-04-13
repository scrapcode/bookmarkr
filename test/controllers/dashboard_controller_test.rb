require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show_user_tags" do
    get :show_user_tags
    assert_response :success
  end

end
