class Server < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :views, File.dirname(__FILE__) + '/views'
  set :public_folder, File.dirname(__FILE__) + '/public'
  helpers Helpers
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    session[:start_date] = nil
    @spaces = Space.all
    erb :index
  end


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

  post '/request/new' do
    from_date = params[:startdate]
    to_date = params[:enddate]
    @booking = Booking.create(from_date: from_date,
                  to_date: to_date,
                  hired: false,
                  created_on: Time.new,
                  user_id: session[:user_id],
                  space_id: session[:request_id])
    if @booking.save
      redirect to '/request'
    else 
      flash.now[:errors] = @booking.errors.full_messages
      redirect to '/'
    end
  end

  get '/request' do
    @bookings = Booking.all(:user_id => session[:user_id])
    erb :'request/index'
  end


  run! if app_file == $0

end
