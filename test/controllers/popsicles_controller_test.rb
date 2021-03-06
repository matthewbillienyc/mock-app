require 'test_helper'
require 'mocha/mini_test'

class PopsiclesControllerTest < ActionController::TestCase
  include PopsiclesDataHelper

  describe 'PopsiclesControllerTest' do
    describe 'index logged in' do
      before do
        session[:email] = 'test@test.com'
        stub_popsicle_summaries
      end
      it 'should return popsicle summaries and render popsicles/index' do
        # arrange

        # act
        get :index

        # assert
        assert_response 200
        assert_template :index
      end
    end

    describe 'index not logged in' do
      it 'should redirect to root if not logged in' do
        get :index

        assert_response 302
        assert_redirected_to root_path
      end
    end

    describe 'show' do
      before do
        @serial_number = 1234556
        stub_popsicle_details(@serial_number)
        # session[:email] ?
        session[:email] = 'test@test.com'
      end
      it 'should render popsicle details for a popsicle' do
        get :show, serial_number: @serial_number
        assert_response 200
        assert_template :show
      end
    end

    describe 'rate' do
      before do
        @serial_number = 1234556
        stub_popsicle_details(@serial_number)
        session[:email] = 'test@test.com'
        @query ={email: session[:email], serial_number: @serial_number, rating: 4, response_text: "text"}
      end
      #act
      it 'should update the updating to reflect the user input' do
        expected_response = { response: { rating: 5, response_text: 'pretty effin good' }, status: 'R' }
        stub_rate_popsicle(@serial_number, expected_response)

        post :rate, params: @query
        #assert
        assert 200
        
        # this method renders json so you don't want to assert a template
      end
    end
  end
end
