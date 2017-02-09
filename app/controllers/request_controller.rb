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
    my_spaces_ids = []
    @bookings = Booking.all(:user_id => session[:user_id])
    @spaces = Space.all(:user_id => session[:user_id])
    @spaces.each do |space|
    my_spaces_ids << space.id
    end
    @my_booking_request = Booking.all(:space_id => my_spaces_ids)
    erb :'request/index'
  end

  post '/request/validate' do
    if params[:validate]!="deny"
      confirm_booking(params[:request_id].to_i)
      redirect to '/request'
    else
      # TODO: Deny request
    end
  end

end
