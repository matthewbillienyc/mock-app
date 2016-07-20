Before('@stub_logon') do
  stub_logon
end

def stub_logon
  stub_request(:post, %r{.*\/users\/logon})
    .to_return(status: 200, body: { status: 'success', role: '' }.to_json, headers: {})
end


