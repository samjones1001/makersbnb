ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Server < Sinatra::Base

  get '/' do
    'Hello'
  end

  get '/users/new' do
  	@user = User.new
  	erb :'users/new'
  end

  post 'users' do
  	@user.create()
  end

  run! if app_file == $0
end
