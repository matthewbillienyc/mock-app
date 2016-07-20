require 'test_helper'
require 'mocha/mini_test'

class UserTest < ActiveSupport::TestCase
  describe 'UserTest' do
    describe 'initialize' do
      it 'can be initialized with a name' do
        f_name = "Bob"
        l_name = "Franco"
        expected_name = 'Bob Franco'
        user = User.new({first_name: f_name, last_name: l_name})

        assert_equal expected_name, user.name
      end
    end

    describe 'name' do
      it 'should return the full name' do
        user = User.new(first_name: 'bob', last_name: 'billy')
        expected_result = 'bob billy'

        result = user.name

        assert_equal expected_result, result
      end
    end

    describe 'admin?' do
      it 'should return if user is admin or not' do
        user = User.new(first_name: 'bob', last_name: 'billy', role: 'admin')

        result = user.admin?

        assert_equal true, result
      end
    end
  end
end

