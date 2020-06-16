require 'test_helper'

class Page1ControllerTest < ActionDispatch::IntegrationTest
  test "should get page1" do
    get page1_page1_url
    assert_response :success
  end

end
