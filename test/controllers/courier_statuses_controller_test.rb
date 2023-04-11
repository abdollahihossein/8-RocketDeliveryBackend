require "test_helper"

class CourierStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @courier_status = courier_statuses(:one)
  end

  test "should get index" do
    get courier_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_courier_status_url
    assert_response :success
  end

  test "should create courier_status" do
    assert_difference("CourierStatus.count") do
      post courier_statuses_url, params: { courier_status: { name: @courier_status.name } }
    end

    assert_redirected_to courier_status_url(CourierStatus.last)
  end

  test "should show courier_status" do
    get courier_status_url(@courier_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_courier_status_url(@courier_status)
    assert_response :success
  end

  test "should update courier_status" do
    patch courier_status_url(@courier_status), params: { courier_status: { name: @courier_status.name } }
    assert_redirected_to courier_status_url(@courier_status)
  end

  test "should destroy courier_status" do
    assert_difference("CourierStatus.count", -1) do
      delete courier_status_url(@courier_status)
    end

    assert_redirected_to courier_statuses_url
  end
end
