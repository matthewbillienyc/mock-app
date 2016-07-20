Before('@stub_logon') do
  stub_logon
end

Before('@stub_admin_logon') do
  stub_admin_logon
end

Before('@faked_login') do
  faked_user_logged_on
end

def stub_logon
  stub_request(:post, %r{.*\/users\/logon})
    .to_return(status: 200, body: { status: 'success', role: '' }.to_json, headers: {})
end

def stub_admin_logon
  stub_request(:post, %r{.*\/users\/logon})
    .to_return(status: 200, body: { status: 'success', role: 'admin' }.to_json, headers: {})
end


def faked_user_logged_on
  session[:email] = 'admin@admin.com'
end
