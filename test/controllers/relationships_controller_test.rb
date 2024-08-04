require "test_helper"

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get followeds" do
    get relationships_followeds_url
    assert_response :success
  end

  test "should get followers" do
    get relationships_followers_url
    assert_response :success
  end
end
