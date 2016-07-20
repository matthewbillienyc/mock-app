Before('@stub_popsicle_summaries') do
  stub_popsicle_summaries
end

def stub_popsicle_summaries
  stub_request(:get, %r{.*\/popsicles})
    .to_return(status: 200, body: popsicle_summaries.to_json, headers: {})
end

def popsicle_summaries
  [
    {
      serial_number: '1234556',
      flavor: 'delicious',
      joke_funniness: 7,
      stick_wood_type: 'oak',
      company_name: 'bobby popsicle'
    },
    {
      serial_number: '1234557',
      flavor: 'nasty',
      joke_funniness: 10,
      stick_wood_type: 'balsa',
      company_name: 'bobby popsicle'
    }
  ]
end
