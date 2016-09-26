require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get page_home_url
    assert_response :success
  end

  test "should get page1" do
    get page_page1_url
    assert_response :success
  end

  test "should get page2" do
    get page_page2_url
    assert_response :success
  end

end
