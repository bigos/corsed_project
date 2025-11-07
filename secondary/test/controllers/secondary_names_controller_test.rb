require "test_helper"

class SecondaryNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @secondary_name = secondary_names(:one)
  end

  test "should get index" do
    get secondary_names_url
    assert_response :success
  end

  test "should get new" do
    get new_secondary_name_url
    assert_response :success
  end

  test "should create secondary_name" do
    assert_difference("SecondaryName.count") do
      post secondary_names_url, params: { secondary_name: { name: @secondary_name.name } }
    end

    assert_redirected_to secondary_name_url(SecondaryName.last)
  end

  test "should show secondary_name" do
    get secondary_name_url(@secondary_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_secondary_name_url(@secondary_name)
    assert_response :success
  end

  test "should update secondary_name" do
    patch secondary_name_url(@secondary_name), params: { secondary_name: { name: @secondary_name.name } }
    assert_redirected_to secondary_name_url(@secondary_name)
  end

  test "should destroy secondary_name" do
    assert_difference("SecondaryName.count", -1) do
      delete secondary_name_url(@secondary_name)
    end

    assert_redirected_to secondary_names_url
  end
end
