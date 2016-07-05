require 'test_helper'
require 'mocha/mini_test'

class UserTest < ActiveSupport::TestCase
  describe 'UserTest' do
    it 'can be initialized with a name' do
      f_name = "Bob"
      l_name = "Franco"
      expected_name = 'Bob Franco'
      user = User.new({first_name: f_name, last_name: l_name})

      assert_equal expected_name, user.name
    end
  end
end
