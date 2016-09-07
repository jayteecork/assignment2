require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get home1" do
    get :home1
    assert_response :success
  end

end
