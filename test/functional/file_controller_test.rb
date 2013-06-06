require 'test_helper'

class FileControllerTest < ActionController::TestCase
  test "should get upload" do
    get :uploads
    assert_response :success
  end

end
