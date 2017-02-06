ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Server < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect'/users/new'
  end

  get '/users/new' do
  	@user = User.new
  	erb :'users/new'
  end

  post '/users' do
  	@user = User.create(email: params[:email],
                 name: params[:name],
                 username: params[:username],
                 password: params[:password],
                 password_confirm: params[:password_confirm])
  	redirect to('/')
  end

   run! if app_file == $0
end
