ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
require 'minitest/autorun'
require 'minitest/pride'

require 'webmock/minitest'
require 'mocha/mini_test'
require 'popsicles_data_helper'
require 'users_data_helper'

WebMock.disable_net_connect!(allow_localhost: false)

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
