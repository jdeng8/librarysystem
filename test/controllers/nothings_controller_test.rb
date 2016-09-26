require 'test_helper'

class NothingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nothing = nothings(:one)
  end

  test "should get list" do
    get nothings_url
    assert_response :success
  end

  test "should get new" do
    get new_nothing_url
    assert_response :success
  end

  test "should create nothing" do
    assert_difference('Nothing.count') do
      post nothings_url, params: { nothing: { name: @nothing.name } }
    end

    assert_redirected_to nothing_url(Nothing.last)
  end

  test "should show nothing" do
    get nothing_url(@nothing)
    assert_response :success
  end

  test "should get edit" do
    get edit_nothing_url(@nothing)
    assert_response :success
  end

  test "should update nothing" do
    patch nothing_url(@nothing), params: { nothing: { name: @nothing.name } }
    assert_redirected_to nothing_url(@nothing)
  end

  test "should destroy nothing" do
    assert_difference('Nothing.count', -1) do
      delete nothing_url(@nothing)
    end

    assert_redirected_to nothings_url
  end
end
