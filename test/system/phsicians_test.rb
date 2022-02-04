require "application_system_test_case"

class PhsiciansTest < ApplicationSystemTestCase
  setup do
    @phsician = phsicians(:one)
  end

  test "visiting the index" do
    visit phsicians_url
    assert_selector "h1", text: "Phsicians"
  end

  test "should create phsician" do
    visit phsicians_url
    click_on "New phsician"

    fill_in "Email", with: @phsician.email
    fill_in "Name", with: @phsician.name
    fill_in "Unique", with: @phsician.unique_id
    click_on "Create Phsician"

    assert_text "Phsician was successfully created"
    click_on "Back"
  end

  test "should update Phsician" do
    visit phsician_url(@phsician)
    click_on "Edit this phsician", match: :first

    fill_in "Email", with: @phsician.email
    fill_in "Name", with: @phsician.name
    fill_in "Unique", with: @phsician.unique_id
    click_on "Update Phsician"

    assert_text "Phsician was successfully updated"
    click_on "Back"
  end

  test "should destroy Phsician" do
    visit phsician_url(@phsician)
    click_on "Destroy this phsician", match: :first

    assert_text "Phsician was successfully destroyed"
  end
end
