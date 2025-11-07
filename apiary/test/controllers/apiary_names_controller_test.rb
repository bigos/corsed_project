require "test_helper"

class ApiaryNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apiary_name = apiary_names(:one)
  end

  test "should get index" do
    get apiary_names_url
    assert_response :success
  end

  test "should get new" do
    get new_apiary_name_url
    assert_response :success
  end

  test "should create apiary_name" do
    assert_difference("ApiaryName.count") do
      post apiary_names_url, params: { apiary_name: { name: @apiary_name.name } }
    end

    assert_redirected_to apiary_name_url(ApiaryName.last)
  end

  test "should show apiary_name" do
    get apiary_name_url(@apiary_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_apiary_name_url(@apiary_name)
    assert_response :success
  end

  test "should update apiary_name" do
    patch apiary_name_url(@apiary_name), params: { apiary_name: { name: @apiary_name.name } }
    assert_redirected_to apiary_name_url(@apiary_name)
  end

  test "should destroy apiary_name" do
    assert_difference("ApiaryName.count", -1) do
      delete apiary_name_url(@apiary_name)
    end

    assert_redirected_to apiary_names_url
  end
end
