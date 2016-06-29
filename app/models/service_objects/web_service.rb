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

  def self.get_single_user(id)
    url= BASE_URI + EXTENSION + '/users/' + id
    response = get(url)
    # user = JSON.parse(response.body)
    # byebug
    # User.new(name: user['name'])
  end

  def self.post_new_user(name)
    # post(url, :body => { name: name }.to_json)
    url = BASE_URI + EXTENSION + '/users/'
    post(url, :query => {name: name})
  end
end
