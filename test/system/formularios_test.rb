require "application_system_test_case"

class FormulariosTest < ApplicationSystemTestCase
  setup do
    @formulario = formularios(:one)
  end

  test "visiting the index" do
    visit formularios_url
    assert_selector "h1", text: "Formularios"
  end

  test "creating a Formulario" do
    visit formularios_url
    click_on "New Formulario"

    fill_in "Estatura cm", with: @formulario.estatura_cm
    fill_in "Genero", with: @formulario.genero
    fill_in "Horas estadia", with: @formulario.horas_estadia
    fill_in "Nombre drinker", with: @formulario.nombre_drinker
    fill_in "Perfil", with: @formulario.perfil
    fill_in "Peso kg", with: @formulario.peso_kg
    fill_in "Presupuesto", with: @formulario.presupuesto
    click_on "Create Formulario"

    assert_text "Formulario was successfully created"
    click_on "Back"
  end

  test "updating a Formulario" do
    visit formularios_url
    click_on "Edit", match: :first

    fill_in "Estatura cm", with: @formulario.estatura_cm
    fill_in "Genero", with: @formulario.genero
    fill_in "Horas estadia", with: @formulario.horas_estadia
    fill_in "Nombre drinker", with: @formulario.nombre_drinker
    fill_in "Perfil", with: @formulario.perfil
    fill_in "Peso kg", with: @formulario.peso_kg
    fill_in "Presupuesto", with: @formulario.presupuesto
    click_on "Update Formulario"

    assert_text "Formulario was successfully updated"
    click_on "Back"
  end

  test "destroying a Formulario" do
    visit formularios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Formulario was successfully destroyed"
  end
end
