ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'

class Server < Sinatra::Base

  get '/' do
    'Hello'
  end

  run! if app_file == $0
end
