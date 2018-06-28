class Sms
  attr_reader :mobile
  attr_reader :message

  def initialize(mobile, message)
    @mobile = mobile
    @message = message
  end

  def send
    begin
      response = RestClient::Request.execute(verify_ssl: false, method: :post, url: sms_end_point, payload: sms_payload, headers: sms_headers)
    rescue RestClient::ExceptionWithResponse => e
      response = e.response
    end
    # binding.pry
    response
  end

  def sms_end_point
    "https://sapi.getspini.com:8443/SpinGrailsApp/web/site/leads/website/create/for/self/requirement"
  end

  def sms_headers
    {:content_type => "application/json", "X-SPIN-API-ACCESS-TOKEN" => "KOIA8sl#4kasdd98!29jskdlmcxr48b39882#@"}
  end

  def sms_payload
    {
        "prospectiveBuyersName": "Name",
        "phoneNumOfProspectiveBuyer": "9003239004",
        "cityName": "Chennai",
        "categoryName": "Loans",
        "emailOfProspectiveBuyer": "email@email.com",
        "budgetAmount": "10000"
      }.to_json
    # REMOVE jmsQName from payload to avoid being BLACKLISTED by DND
  end
end