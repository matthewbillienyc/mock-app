require 'test_helper'
require 'mocha/mini_test'

class UserTest < ActiveSupport::TestCase
  describe 'UserTest' do
    it 'can be initialized with a name' do
      expected_name = 'Bob'
      user = User.new(name: expected_name)

      assert_equal expected_name, user.name
    end
  end
end