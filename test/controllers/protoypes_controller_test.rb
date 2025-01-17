require "test_helper"

class ProtoypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get protoypes_index_url
    assert_response :success
  end
end
