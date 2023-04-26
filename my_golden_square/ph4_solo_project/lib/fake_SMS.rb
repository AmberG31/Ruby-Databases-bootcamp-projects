require 'twilio-ruby'

class FakeSMS
  # include Twilio - RSpec throws an error
  def initialize
    @account_sid = "AC93e2a92e39a773e2d0015bd327ba175f" #ENV["TWILIO_ACCOUNT_SID"] - HOW TO SET THESE UP?? 
    @auth_token = "aa69d9a4e0849ecf1be50c5a918cc38c"  #ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end
  
  def send_SMS
    eta = Time.new + 20*60
    text = "Thank you! Your order was placed and will be delivered before"
    body = "#{text} #{eta.strftime("%I:%M")}"
    @client.messages.create(to: "+447895387558", 
                            from: "+12028664262", 
                            body: body)
  end
end
