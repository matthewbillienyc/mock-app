# When you have a method or setup for a test that you will want to use over and over agaain,
# rather than add that step every time you can put it in a before hook like this:

Before('@stub_workload') do
  # put any stubs that you need most often here, so you can just tag the step with @stub_workload
  # and it will do whatever you need
  stub_cases
  stub_users
  stub_single_user
  stub_single_case
end


Before('@create_user') do
  stub_create_user
  stub_users
end

Before('@create_case') do
  stub_create_case
  stub_cases
end

Before('@edit_user') do
  stub_single_user
  stub_edit_user
end



# PUT STUB METHODS AND METHODS THAT RETURN FAKE DATA HERE
def stub_single_user
  stub_request(:get, %r{.*\/users/\d}).
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => dummy_users[0].to_json, :headers => {})
end

def stub_single_case
  stub_request(:get, %r{.*\/cases/\d}).
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => dummy_cases[0].to_json, :headers => {})
end

def stub_create_case
  stub_request(:post, "http://localhost:8080/mockapi/cases?description=The%20mountain%20stirs%20once%20more&user_id=1").
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => "", :headers => {})

end



def stub_create_user
  stub_request(:post, "http://localhost:8080/mockapi/users?first_name=Capy&last_name=Bara").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => "", :headers => {})
end

def stub_edit_user
  stub_request(:post, "http://localhost:8080/mockapi/users?first_name=Capy&last_name=Bara").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => "", :headers => {})
end

def stub_users
  stub_request(:get, %r{.*\/users}).
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => dummy_users.to_json, :headers => {})
end


def stub_cases
  stub_request(:get, %r{.*\/cases}).
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => dummy_cases.to_json, :headers => {})
end

def dummy_cases
  [{description: "The mountain stirs once more", user_id: 3}, {description: "mentor development synergies?", user_id: 3}]
end

def dummy_users
  [{first_name: "Swaylor", last_name: "Tift"}, {first_name: "Dillem", last_name: "Wafoe"}]
end
