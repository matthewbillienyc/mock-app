require 'test_helper'
require 'mocha/mini_test'

class PopsiclesControllerTest < ActionController::TestCase
  include PopsiclesDataHelper

  describe 'PopsiclesControllerTest' do
    describe 'index' do
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

    describe 'show' do
      before do
        # @serial_number
        # stub_popsicle_details(@serial_number)
        # session[:email] ?
      end
      it 'should render popsicle details for a popsicle' do
        get :show, serial_number: @serial_number

        assert_response 200
        assert_template :show
      end
    end
  end
end