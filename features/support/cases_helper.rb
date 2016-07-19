Before('@stub_workload') do
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
  stub_single_account
end

Before('@edit_case') do
  stub_single_case
  stub_edit_case
end

Before('@stub_popsicles') do
  stub_popsicles
  stub_single_popsicle
end


###SHOW STUBS ###
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


def stub_single_account
  stub_request(:get, "http://localhost:8080/mockapi/accounts/1").
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => dummy_account.to_json, :headers => {})
end

def stub_single_popsicle
  stub_request(:get, "http://localhost:8080/mockapi/popsicles/1").
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => dummy_popsicles[0].to_json, :headers => {})
end
#========================================#


###CREATE STUBS###
def stub_create_case
  stub_request(:post, "http://localhost:8080/mockapi/cases?description=The%20mountain%20stirs%20once%20more&user_id=1").
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => "", :headers => {})

end

def stub_create_user
  stub_request(:post, "http://localhost:8080/mockapi/users?email=&first_name=Capy&last_name=Bara&password=&password_confirmation=").
       with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
       to_return(:status => 200, :body => "", :headers => {})
end
#========================================#

###EDIT STUBS###
def stub_edit_user
  stub_request(:post, "http://localhost:8080/mockapi/users?email=&first_name=Capy&last_name=Bara&password=&password_confirmation=").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => "", :headers => {})
end

def stub_edit_case
  stub_request(:post, "http://localhost:8080/mockapi/cases?description=New%20Description&user_id=1").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => "", :headers => {})
end
#========================================#

###INDEX STUBS###
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

def stub_popsicles
  stub_request(:get, %r{.*\/popsicles}).
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => dummy_popsicles.to_json, :headers => {})
end
#========================================#

### Dummy Info ###

def dummy_cases
  [{description: "The mountain stirs once more", user_id: 3}, {description: "mentor development synergies?", user_id: 3}]
end

def dummy_users
  [{first_name: "Swaylor", last_name: "Tift"}, {first_name: "Dillem", last_name: "Wafoe"}]
end

def dummy_account
  { employer: 'something', account_number: '12345', organization: { name: 'CIA', state: 'VA' } }
end

def dummy_popsicles
  [{flavor: "Rustic Cotton Lamp", color: "grey", rating: "5", shape: "round", serial_number: "77836575", company_id: 1, status: "U"},
   {flavor: "Aerodynamic Granite Keyboard", color: "turquoise", rating: "0", shape: "round", serial_number: "12911973", company_id: 4, status: "U"}]
end
