require 'test_helper'
require 'mocha/mini_test'

class UsersControllerTest < ActionController::TestCase
  describe 'UsersControllerTest' do
    it 'should render the new template successfully' do
      get :new
      assert_response 200
      assert_template :new
    end
  end
end