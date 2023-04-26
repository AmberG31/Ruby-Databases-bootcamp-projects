require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end
    # Request:
    #GET /hello?name=Leo

    # Expected response (200 OK):
    #Hello Leo
  get '/' do 
    return 'hi'
  end

  get '/hello' do 
    return erb(:index)
    # name = params[:name]
    # return "Hello #{name}"
  end

  post '/submit' do 
    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you sent this message:#{message}"
  end

  get '/names' do

    return "Julia, Mary, Karim"
  end

  get '/sort-names' do
    names = params[:names]
    sorted_names = names.split(',').sort!
    return sorted_names.join(',')
  end
end