require 'cucumber/rails'
require 'capybara/cucumber'
require 'webmock/cucumber'
require 'phantomjs'

ActionController::Base.allow_rescue = false

begin
  # DatabaseCleaner.strategy = :transaction
  # DatabaseCleaner.clean_with :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Capybara.register_driver :poltergeist do |app|
  options = { js_errors: false, timeout: 3.minute, phantomjs_logger: StringIO.new, logger: nil, window_size: [1300, 1000],
              phantomjs_options: ['--load-images=no', '--ignore-ssl-errors=yes', '--proxy-type=socks5', '--proxy=0.0.0.0:0', '--ssl-protocol=any'] }
  Capybara::Poltergeist::Driver.new app, options
end

Capybara.javascript_driver = :poltergeist
Capybara.default_driver = :rack_test
Capybara.raise_server_errors = false
Capybara.default_selector = :css
Capybara.default_max_wait_time = 5

WebMock.disable_net_connect!(:allow_localhost => true)

Cucumber::Rails::Database.javascript_strategy = :transaction

After do
  page.driver.reset!
end
