require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  fixtures :all

  test 'View resthooks admin panel' do
    get '/resthook'
    assert_response :success
  end
end
