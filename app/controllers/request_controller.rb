class Server < Sinatra::Base

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
  
end
