require "test_helper"

class PrimaryNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @primary_name = primary_names(:one)
  end

  test "should get index" do
    get primary_names_url
    assert_response :success
  end

  test "should get new" do
    get new_primary_name_url
    assert_response :success
  end

  test "should create primary_name" do
    assert_difference("PrimaryName.count") do
      post primary_names_url, params: { primary_name: { name: @primary_name.name } }
    end

    assert_redirected_to primary_name_url(PrimaryName.last)
  end

  test "should show primary_name" do
    get primary_name_url(@primary_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_primary_name_url(@primary_name)
    assert_response :success
  end

  test "should update primary_name" do
    patch primary_name_url(@primary_name), params: { primary_name: { name: @primary_name.name } }
    assert_redirected_to primary_name_url(@primary_name)
  end

  test "should destroy primary_name" do
    assert_difference("PrimaryName.count", -1) do
      delete primary_name_url(@primary_name)
    end

    assert_redirected_to primary_names_url
  end
end
