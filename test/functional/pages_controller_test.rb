require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  #test "the truth" do
    #assert true
  #end

  test "should home page" do
    get :home, :id => pages(:one).to_param
    assert_response :success
  end

  test "should help page" do
    get :help, :id => pages(:one).to_param
    assert_response :success
  end
  
  test "should about page" do
    get :about, :id => pages(:one).to_param
    assert_response :success
  end

  test "should contact page" do
    get :contact, :id => pages(:one).to_param
    assert_response :success
  end
end
