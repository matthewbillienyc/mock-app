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
        user = { first_name: 'Bob', last_name: 'Franco' }
        account = { employer: 'employer', account_number: '123', organization: { name: 'org', state: 'ny' } }
        stub_request(:get, %r{.*\/accounts})
          .to_return(status: 200, body: account.to_json, headers: {})
        stub_request(:get, %r{.*\/users})
          .to_return(status: 200, body: user.to_json, headers: {})

        #act
        get :show, id: 1

        #assert_response
        assert_response 200
        assert_template :show
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
        users = [ { first_name: 'Bob', last_name: 'Franco' }, { first_name: 'Diane', last_name: 'Sawyer' }]
        account = { employer: 'employer', account_number: '123', organization: { name: 'org', state: 'ny' } }
        stub_request(:get, %r{.*\/accounts})
          .to_return(status: 200, body: account.to_json, headers: {})
        stub_request(:get, %r{.*\/users})
          .to_return(status: 200, body: users.to_json, headers: {})

        #act
        get :index

        #assert_response
        assert_response 200
        assert_template :index
      end
    end

    describe 'new' do
      it 'displays the form for a new user' do
        user = {first_name: "Frames", last_name: "Janco"}
        stub_request(:get, %r{.*\/accounts})
          .to_return(status: 200, body: " ", headers: {})
        stub_request(:get, %r{.*\/users})
          .to_return(status: 200, body: " ", headers: {})

        get :new

        assert_response 200
        assert_template :new
      end
    end

    describe 'create' do
      it 'posts data to the API' do
        user = {first_name: "Frames", last_name: "Janco"}
        stub_request(:post, %r{.*\/accounts})
          .to_return(status: 200, body: " ", headers: {})
        stub_request(:post, %r{.*\/users})
          .to_return(status: 200, body: " ", headers: {})

        post :create

        assert_response 200
      end
    end

    describe 'edit' do
      it 'displays the edit form for a new user' do
        new_user_info = {first_name: "Frames", last_name: "Janco"}
      end

    end

    describe 'update' do

    end

  end
end
