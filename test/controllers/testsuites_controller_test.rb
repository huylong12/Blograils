require 'test_helper'

class TestsuitesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get testsuites_index_url
    assert_response :success
  end

end
