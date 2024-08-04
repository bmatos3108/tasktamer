require "test_helper"

class GroceriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get groceries_index_url
    assert_response :success
  end

  test "should get new" do
    get groceries_new_url
    assert_response :success
  end

  test "should get create" do
    get groceries_create_url
    assert_response :success
  end
end
