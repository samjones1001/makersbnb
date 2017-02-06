ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Server < Sinatra::Base

  get '/' do
    "hello"
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
