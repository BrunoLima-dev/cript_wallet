require 'test_helper'

class WwelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wwelcome_index_url
    assert_response :success
  end

end
