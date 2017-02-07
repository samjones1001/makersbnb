ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Server < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  post '/spaces/search' do
    @space = Space.create(name: "Space 1", description: "First Space", price_per_night: 45.00, user_id: 1)
    @start_date = format_date(params[:start_date])
    @end_date = format_date(params[:end_date])
    @spaces = Space.all
    erb :index
  end

  get '/spaces/' do
    @request_id = params[:request].to_i
    erb :'spaces/query'
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
  		redirect to('/users/new')
  	else
  		flash.now[:errors] = @user.errors.full_messages
  		erb :'users/new'
  	end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/sessions/new')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect to 'sessions/new'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def format_date(date)
      DateTime.parse(date).strftime('%d-%m-%Y')
    end
  end

  run! if app_file == $0
end
