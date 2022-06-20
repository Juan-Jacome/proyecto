require "application_system_test_case"

class CoctelsTest < ApplicationSystemTestCase
  setup do
    @coctel = coctels(:one)
  end

  test "visiting the index" do
    visit coctels_url
    assert_selector "h1", text: "Coctels"
  end

  test "creating a Coctel" do
    visit coctels_url
    click_on "New Coctel"

    fill_in "Gramos alcohol", with: @coctel.gramos_alcohol
    fill_in "Nombre coctel", with: @coctel.nombre_coctel
    fill_in "Precio", with: @coctel.precio
    click_on "Create Coctel"

    assert_text "Coctel was successfully created"
    click_on "Back"
  end

  test "updating a Coctel" do
    visit coctels_url
    click_on "Edit", match: :first

    fill_in "Gramos alcohol", with: @coctel.gramos_alcohol
    fill_in "Nombre coctel", with: @coctel.nombre_coctel
    fill_in "Precio", with: @coctel.precio
    click_on "Update Coctel"

    assert_text "Coctel was successfully updated"
    click_on "Back"
  end

  test "destroying a Coctel" do
    visit coctels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coctel was successfully destroyed"
  end
end
