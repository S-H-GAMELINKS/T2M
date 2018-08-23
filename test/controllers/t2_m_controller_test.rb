require 'test_helper'

class T2MControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get t2_m_index_url
    assert_response :success
  end

end
