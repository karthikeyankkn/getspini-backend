class Sms
  attr_reader :data
  # attr_reader :message

  def initialize(data)
    # binding.pry
    @data = data
    # @message = message
  end

  def send
    begin
      response = RestClient::Request.execute(verify_ssl: false, method: :post, url: sms_end_point, payload: sms_payload, headers: sms_headers)
    rescue RestClient::ExceptionWithResponse => e
      # binding.pry
      response = e.response
    end
    # binding.pry
    response

  end

  def sms_end_point
    # "https://api.getspini.com:8443/SpinGrailsApp/notifications/utilities/generic/sms"
    "https://api.getspini.com:8443/SpinGrailsApp/web/site/leads/website/create/for/self/requirement"
  end

  def sms_headers
    {:content_type => "application/json", 'X-SPIN-API-ACCESS-TOKEN' => "HJKhlkasehl%jakbdajd81836sagsagHGSC*&t3@!UI"}
  end

  def sms_payload
    # binding.pry
            {
              cityName: @data[:cityName],
              categoryName: @data[:categoryName],
              prospectiveBuyersName: @data[:prospectiveBuyersName],
              emailOfProspectiveBuyer: @data[:emailOfProspectiveBuyer],
              phoneNumOfProspectiveBuyer: @data[:phoneNumOfProspectiveBuyer],
              # categoryName:@lead[:category],
              budgetAmount: @data[:budgetAmount]
            }.to_json
    # REMOVE jmsQName from payload to avoid being BLACKLISTED by DND
  end
end