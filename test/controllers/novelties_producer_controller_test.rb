require 'test_helper'

class NoveltiesProducerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get novelties_producer_index_url
    assert_response :success
  end

end
