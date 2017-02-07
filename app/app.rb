ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Server < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    "hello"
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
                 password_confirmation: params[:password_confirmation])
  	if @user.save
  		session[:user_id] = @user.id
  		redirect to('/users/test')
  	else
  		flash.now[:errors] = @user.errors.full_messages
  		erb :'users/new'
  	end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/spaces/new' do
    erb(:'/spaces/new')
  end

  post '/spaces' do
    @space = Space.create(
    name: params[:name],
    description: params[:description],
    price_per_night: params[:price_per_night],
    image: params[:image])

    if @space.save
      redirect to('/')
    else
      erb(:'/spaces/new')
    end
  end


  run! if app_file == $0
end
