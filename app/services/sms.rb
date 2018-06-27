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
    "https://api.getspini.com:8443/SpinGrailsApp/notifications/utilities/generic/sms"
  end

  def sms_headers
    {:content_type => "application/json", 'X-SPIN-API-ACCESS-TOKEN' => "HJKhlkasehl%jakbdajd81836sagsagHGSC*&t3@!UI"}
  end

  def sms_payload
    {
    "phoneNumbers":[@mobile],
    "messageToSend": @message,
    "canSendToUnRegisteredNumbersAsWell": true,
    "jmsQName": "TransactionalSMS"
    }.to_json
    # REMOVE jmsQName from payload to avoid being BLACKLISTED by DND
  end
end