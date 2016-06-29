require 'httparty'

class WebService
  include HTTParty
  format :json

  BASE_URI = 'http://localhost:8080/'

  def self.get_all_users
  end

  def self.post_new_user
  end
end