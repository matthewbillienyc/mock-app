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
    users.sort_by!{|user| user["id"]}

    users.map do |user|
      User.new(name: user['name'])
    end

  end

  def self.get_account_for_user(id)
    # stuff
    url= BASE_URI + EXTENSION + '/accounts/' + id.to_s
    response = get(url)
    account= JSON.parse(response.body)
    Account.new(account)
  end

  def self.get_single_user_by(id)
    url= BASE_URI + EXTENSION + '/users/' + id
    response = get(url)
    user = JSON.parse(response.body)
    User.new(name: response.parsed_response["name"])
  end

  def self.post_new_user(name)
    # post(url, :body => { name: name }.to_json)
    url = BASE_URI + EXTENSION + '/users/'
    post(url, :query => {name: name})
  end

  def self.put_update_user(id, name)
    url = BASE_URI + EXTENSION + '/users/' + id
    put(url, :query => {name: name})
  end

  def self.get_all_cases
    url = BASE_URI + EXTENSION + '/cases'
    response = get(url)
    cases = JSON.parse(response.body)
    cases.map {|cas| Case.new(description: cas['description'], user_id: cas['user_id'])}
  end

  def self.get_single_case_by(id)
    url = BASE_URI + EXTENSION + '/cases/' + id
    response = get(url)
    cas = JSON.parse(response.body)
    Case.new(description: response.parsed_response['description'], user_id: response.parsed_response['user_id'])
  end

  def self.get_all_cases_by_user(id)
    url = BASE_URI + EXTENSION + '/cases' + '/users/' + id
    byebug
    response= get(url)
    cases = JSON.parse(response.body)
    cases.map {|cas| Case.new(description: cas['description'], user_id: cas['user_id'])}
  end


end
