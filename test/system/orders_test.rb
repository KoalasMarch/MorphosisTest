require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Address", with: @order.address
    fill_in "District", with: @order.district
    fill_in "First name", with: @order.first_name
    fill_in "Last name", with: @order.last_name
    fill_in "Province", with: @order.province
    fill_in "Status", with: @order.status
    fill_in "Sub district", with: @order.sub_district
    fill_in "Total price", with: @order.total_price
    fill_in "Zip code", with: @order.zip_code
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Address", with: @order.address
    fill_in "District", with: @order.district
    fill_in "First name", with: @order.first_name
    fill_in "Last name", with: @order.last_name
    fill_in "Province", with: @order.province
    fill_in "Status", with: @order.status
    fill_in "Sub district", with: @order.sub_district
    fill_in "Total price", with: @order.total_price
    fill_in "Zip code", with: @order.zip_code
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
