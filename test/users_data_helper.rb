module UsersDataHelper
  def stub_update_user(id, body)
    stub_request(:put, %r{.*\/users\/#{id}}).
      to_return(:status => 200, :body => body.to_json, :headers => {})
  end

  def stub_create_user(user)
    stub_request(:post, %r{.*\/users})
      .to_return(status: 200, body: user.to_json, headers: {})
  end

  def stub_account(account)
    stub_request(:get, %r{.*\/accounts/\d})
      .to_return(status: 200, body: account.to_json, headers: {})
  end

  def stub_user(user)
    stub_request(:get, %r{.*\/users/\d})
      .to_return(status: 200, body: user.to_json, headers: {})
  end
end
