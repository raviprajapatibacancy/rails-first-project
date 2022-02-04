require "test_helper"

class PhsiciansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phsician = phsicians(:one)
  end

  test "should get index" do
    get phsicians_url
    assert_response :success
  end

  test "should get new" do
    get new_phsician_url
    assert_response :success
  end

  test "should create phsician" do
    assert_difference("Phsician.count") do
      post phsicians_url, params: { phsician: { email: @phsician.email, name: @phsician.name, unique_id: @phsician.unique_id } }
    end

    assert_redirected_to phsician_url(Phsician.last)
  end

  test "should show phsician" do
    get phsician_url(@phsician)
    assert_response :success
  end

  test "should get edit" do
    get edit_phsician_url(@phsician)
    assert_response :success
  end

  test "should update phsician" do
    patch phsician_url(@phsician), params: { phsician: { email: @phsician.email, name: @phsician.name, unique_id: @phsician.unique_id } }
    assert_redirected_to phsician_url(@phsician)
  end

  test "should destroy phsician" do
    assert_difference("Phsician.count", -1) do
      delete phsician_url(@phsician)
    end

    assert_redirected_to phsicians_url
  end
end
