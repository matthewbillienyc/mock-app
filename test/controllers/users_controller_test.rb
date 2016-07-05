require 'test_helper'
require 'mocha/mini_test'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  describe 'UserTest' do
    describe 'show' do
      it 'should display the name of requested user' do
        #arrange
        first_name = 'Bob'
        last_name = 'Franco'
        full_name = first_name +" "+ last_name

        #act
        get :show, id: 1

        #assert_response
        assert_response 200
      end

      # it 'should display their address' do
      #   add_line_1 = "1234 Main Street"
      #   city= "Townsville"
      #   state= "New State"
      #   zip_code= "12345"
      #   full_add = add_line_1 + ", " + city + ", " + state + ", " + zip_code
      #   request = stub_request(:get, 'http://whatever').with(headers: {etc: 'etc'}, query: {first_name: "Bob", last_name: "Franco"}).to_return(body: "Bob Franco, 1234 Main Street, Townsville, New State, 12345")
      #   assert_includes request.response.body, full_add
      # end

    end

    describe 'index' do
      it 'should return all users' do
        #blah
      end

    end

  end
end
