require "spec_helper"
require "rack/test"
require_relative "../../app"

RSpec.describe Application do

  include Rack::Test::Methods
  let(:app) { Application.new }

  context "GET /names" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = get('/names')
      expect(response.status).to eq(200)
      expect(response.body).to eq('Julia, Mary, Karim')
    end

    it 'returns 404 Not Found' do
      response = get('/namez')
      expect(response.status).to eq(404)
      # expect(response.body).to eq(expected_response)
    end
  end
  
    context "GET /sort-names" do
        it "returns 200 OK" do
            response = get('/sort-names?names=Anna,Amber,Beth,Steve')
            expect(response.status).to eq(200)
            expect(response.body).to eq('Amber,Anna,Beth,Steve')
        end
    end
    context "GET /hello" do
      it "returns html hello view" do
        response = get('/hello')
        expect(response.body).to include('<h1>Hello!</h1>')
      end
    end
end
