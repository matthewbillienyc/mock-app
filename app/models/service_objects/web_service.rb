require 'httparty'

class WebService
  include HTTParty
  format :json



  def self.get_all_users

    url = "#{BASE_URI}/#{EXTENSION}/#{USERS}"
    request = get(url)
    users = JSON.parse(request.body)
    users.sort_by!{|user| user["id"]}

    users.map do |user|
      User.new(first_name: user['first_name'], last_name: user['last_name'])
    end

  end

  def self.get_account_for_user(id)
    url= "#{BASE_URI}/#{EXTENSION}/#{ACCOUNTS}/1"
    request = get(url)
    account= JSON.parse(request.body)
    Account.new(account)
  end

  def self.get_single_user_by(id)
    url= "#{BASE_URI}/#{EXTENSION}/#{USERS}/#{id}"

    request = get(url)
    user = JSON.parse(request.body)
    User.new(first_name: request.parsed_response["first_name"],last_name: request.parsed_response["last_name"])
  end

  def self.post_new_user(params)
    # post(url, :body => { first_name: first_name, last_name: last_name }.to_json)

    url = "#{BASE_URI}/#{EXTENSION}/#{USERS}"
    post(url, :query => {first_name: params[:first_name], last_name: params[:last_name]})
  end

  def self.put_update_user(id, name)
    byebug
    url = "#{BASE_URI}/#{EXTENSION}/#{USERS}/#{id}"
    
    put(url, :query => {first_name: name[:first_name], last_name: name[:last_name]})
  end

  def self.get_all_cases
    url = "#{BASE_URI}/#{EXTENSION}/#{CASES}"
    request = get(url)
    cases = JSON.parse(request.body)
    cases.map {|cas| Case.new(description: cas['description'], user_id: cas['user_id'])}
  end

  def self.get_single_case_by(id)
    url = "#{BASE_URI}/#{EXTENSION}/#{CASES}/#{id}"
    request = get(url)
    cas = JSON.parse(request.body)
    Case.new(description: request.parsed_response['description'], user_id: request.parsed_response['user_id'])
  end

  def self.get_all_cases_by_user(id)
    url = "#{BASE_URI}/#{EXTENSION}/#{CASES}/#{USERS}/#{id}"
    request= get(url)
    cases = JSON.parse(request.body)
    cases.map {|cas| Case.new(description: cas['description'], user_id: cas['user_id'])}
  end

  def self.post_new_case(params)
    url = "#{BASE_URI}/#{EXTENSION}/#{CASES}"
    post(url, :query => {description: params[:description], user_id: 1})
  end

  def self.put_update_case(id, description)
    url = "#{BASE_URI}/#{EXTENSION}/#{CASES}/#{id}"
    put(url, :query => {description: description})
  end

end
