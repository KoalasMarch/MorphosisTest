require "application_system_test_case"

class ProductSetsTest < ApplicationSystemTestCase
  setup do
    @product_set = product_sets(:one)
  end

  test "visiting the index" do
    visit product_sets_url
    assert_selector "h1", text: "Product Sets"
  end

  test "creating a Product set" do
    visit product_sets_url
    click_on "New Product Set"

    fill_in "Product", with: @product_set.product_id
    fill_in "Region", with: @product_set.region_id
    click_on "Create Product set"

    assert_text "Product set was successfully created"
    click_on "Back"
  end

  test "updating a Product set" do
    visit product_sets_url
    click_on "Edit", match: :first

    fill_in "Product", with: @product_set.product_id
    fill_in "Region", with: @product_set.region_id
    click_on "Update Product set"

    assert_text "Product set was successfully updated"
    click_on "Back"
  end

  test "destroying a Product set" do
    visit product_sets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product set was successfully destroyed"
  end
end
