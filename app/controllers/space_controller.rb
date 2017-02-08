class Server < Sinatra::Base
  post '/spaces/search' do
    session[:start_date] = params[:start_date]
    session[:end_date] = params[:end_date]
    @date_range = session[:start_date]..session[:end_date]
    @spaces = Space.all
    erb :index
  end

  get '/spaces/' do
    session[:request_id] = params[:request].to_i
    @space = Space.first(:id => session[:request_id])
    erb :'spaces/query'
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

end
