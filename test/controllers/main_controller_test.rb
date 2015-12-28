require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get cover" do
    get :cover
    assert_response :success
  end

  test "should get rank" do
    get :rank
    assert_response :success
  end

  test "should get score" do
    get :score
    assert_response :success
  end

end
