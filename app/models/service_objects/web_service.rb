require 'httparty'

class WebService
  include HTTParty
  format :json

  def self.get_notes(email, popsicle_serial_number)
    url = "#{BASE_URI}/#{EXTENSION}/#{NOTES}/#{popsicle_serial_number}"
    headers = { "Logon-Id" => email }
    response = get(url, headers: headers)
    notes = JSON.parse(response.body)
    notes.map do |note|
      Note.new(note)
    end
  end

  def self.post_note(email, note_params)
    url = "#{BASE_URI}/#{EXTENSION}/#{NOTES}"
    headers = { "Logon-Id" => email }
    query = { email: email, popsicle_serial_number: note_params[:popsicle_serial_number], text: note_params[:text], importance: note_params[:importance] }
    response = post(url, headers: headers, query: query)
    JSON.parse(response.body)
  end

  def self.rate_popsicle(email, sn, rating, text)
    url = "#{BASE_URI}/#{EXTENSION}/#{POPSICLES}/rate"
    headers = { "Logon-Id" => email }
    query={email: email, serial_number: sn, rating: rating, response_text: text}
    response = post(url, headers: headers, query: query)
    JSON.parse(response.body)
  end

  def self.get_popsicle_summaries(email)
    url = "#{BASE_URI}/#{EXTENSION}/#{POPSICLES}"
    headers = { "Logon-Id" => email }
    response = get(url, headers: headers)
    summaries = JSON.parse(response.body)
    summaries.map do |summary|
      PopsicleSummary.new(summary)
    end
  end

  def self.get_popsicle_details(email, serial_number)
    url = "#{BASE_URI}/#{EXTENSION}/#{POPSICLES}/#{serial_number}"
    headers = { "Logon-Id" => email }
    response = get(url, headers: headers)
    Popsicle.new(response.parsed_response)
  end

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
    response = post(url, :query => {first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation]})
    user = JSON.parse(response.body)
    User.new(user)
  end

  def self.put_update_user(id, name)
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
    cas = Case.new(description: request.parsed_response["description"], user_id: request.parsed_response['user_id'])
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

  def self.logon(email, password)
    url= "#{BASE_URI}/#{EXTENSION}/#{USERS}/#{LOGON}"
    post(url, :query => {email: email, password: password}).parsed_response
  end

end
