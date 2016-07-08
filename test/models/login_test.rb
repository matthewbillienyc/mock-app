require "test_helper"

class LoginTest < ActiveSupport::TestCase
  def login
    @login ||= Login.new
  end

  def test_valid
    assert login.valid?
  end
end
