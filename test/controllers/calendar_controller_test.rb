require "test_helper"

class CalendarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get calendar_index_url
    assert_response :success
  end

  test "should get create_event" do
    get calendar_create_event_url
    assert_response :success
  end
end
