class Server < Sinatra::Base

  get '/dashboard' do
    if logged_in?
      my_spaces_ids = []
      @bookings = Booking.all(:user_id => session[:user_id])
      @spaces = Space.all(:user_id => session[:user_id])
      @spaces.each do |space|
      my_spaces_ids << space.id
      end
      @my_booking_request = Booking.all(:space_id => my_spaces_ids)
      erb :'dashboard/index'
    else
      redirect '/sessions/new'
    end
  end

end
