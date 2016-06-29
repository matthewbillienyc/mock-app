require 'httparty'

class WebService
  include HTTParty
  format :json

  BASE_URI = 'http://localhost:8080/'
  EXTENSION = 'mockapi'

  def self.get_all_users
    url = BASE_URI + EXTENSION + '/users'
    response = get(url)
    users = JSON.parse(response.body)
    users.map do |user|
      User.new(name: user['name'])
    end
  end

  def self.post_new_user
  end
end