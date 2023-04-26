require "fake_SMS"

RSpec.describe FakeSMS do
  let(:client) { FakeSMS.new }
  let(:message_double) { instance_double(Twilio::REST::Api::V2010::AccountContext::Message) }
  before do
    allow(Twilio::REST::Client).to receive(:new).and_return(client)
    allow(client).to receive(:messages).and_return(message_double)
    allow(message_double).to receive(:create).and_return(true)
  end
  it "sends a message" do
    expect(client.send_message("+1234567890", "+0987654321", "Hello World")).to eq(true)
  end
end

# not sure how to create RSpec tests 