require "test_helper"

class CoctelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coctel = coctels(:one)
  end

  test "should get index" do
    get coctels_url
    assert_response :success
  end

  test "should get new" do
    get new_coctel_url
    assert_response :success
  end

  test "should create coctel" do
    assert_difference('Coctel.count') do
      post coctels_url, params: { coctel: { gramos_alcohol: @coctel.gramos_alcohol, nombre_coctel: @coctel.nombre_coctel, precio: @coctel.precio } }
    end

    assert_redirected_to coctel_url(Coctel.last)
  end

  test "should show coctel" do
    get coctel_url(@coctel)
    assert_response :success
  end

  test "should get edit" do
    get edit_coctel_url(@coctel)
    assert_response :success
  end

  test "should update coctel" do
    patch coctel_url(@coctel), params: { coctel: { gramos_alcohol: @coctel.gramos_alcohol, nombre_coctel: @coctel.nombre_coctel, precio: @coctel.precio } }
    assert_redirected_to coctel_url(@coctel)
  end

  test "should destroy coctel" do
    assert_difference('Coctel.count', -1) do
      delete coctel_url(@coctel)
    end

    assert_redirected_to coctels_url
  end
end
