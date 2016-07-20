module PopsiclesDataHelper
  def stub_popsicle_summaries
    stub_request(:get, %r{.*\/popsicles})
      .to_return(status: 200, body: popsicle_summaries.to_json, headers: {})
  end

  def stub_popsicle_details(serial_number)
    stub_request(:get, %r{.*\/popsicles/#{serial_number}})
      .to_return(status: 200, body: popsicle_details.to_json, headers:{})
  end

  # always use the regex
  def stub_rate_popsicle(serial_number, body)
    stub_request(:post, %r{.*\/popsicles\/rate})
      .to_return(status: 200, body: body.to_json, headers: {})
  end

  private  

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

  def popsicle_details
    {
      serial_number:"25886614",
      flavor:"Sleek Paper Chair",
      color:"magenta",
      rating:"0",
      shape:"square",
      status:"U",
      stick:
        {wood_type:"Practical Paper Shoes",
         color:"white",
         centimeters:0,
         joke:
          {question:
            "Swag schlitz dreamcatcher.",
            punchline:"quas",
            funniness:8,
            dirtiness:3,
            author:"Lila Shanahan"}
            },
          company:
            {
              name:"Spencer,Thompson and Mosciski",
              popsicle_varieties:40
            },
          response:
            {
              rating:nil,
              response_text:nil
            }
          }
  end
end
