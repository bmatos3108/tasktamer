require "test_helper"

class FunQuotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fun_quotes_index_url
    assert_response :success
  end
end
