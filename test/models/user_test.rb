require 'test_helper'

class UserTest < ActiveSupport::TestCase

  describe 'UserTest' do
    it 'should take a name when initialized' do
      expected_name = 'Bob'
      user = User.new(name: expected_name)

      assert_equal expected_name, user.name
    end
  end
end