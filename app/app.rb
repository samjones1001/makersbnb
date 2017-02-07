ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Server < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
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
  		redirect to('/')

  	else
  		flash.now[:errors] = @user.errors.full_messages
  		erb :'users/new'
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
    image: params[:image], user_id: current_user.id)

    date_from  = Date.parse(params[:available_from])
    date_to  = Date.parse(params[:available_to])
    date_array = (date_from..date_to)

    date_array.each do |i|
      Availabledate.create(date: i, available: true, space_id: @space.id)
    end

    if @space.save
      redirect to('/')
    else
      erb(:'/spaces/new')
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

  run! if app_file == $0
end
