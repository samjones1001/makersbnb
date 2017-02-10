class Server < Sinatra::Base

  post '/request/new' do
    from_date = params[:startdate]
    to_date = params[:enddate]
    if valid_date_range(from_date.to_s, to_date.to_s)
      @booking = Booking.create(from_date: from_date,
                                to_date: to_date,
                                hired: false,
                                created_on: Time.new,
                                user_id: session[:user_id],
                                space_id: session[:request_id])
      if @booking.save
        redirect to '/dashboard'
      else
        flash.now[:errors] = @booking.errors.full_messages
        redirect to '/users/new'
      end
    else
      flash.now[:errors] = "Invalid date range"
      redirect to '/spaces/'
    end
  end


  post '/request/validate' do
    if params[:validate]!="deny"
      confirm_booking(params[:request_id].to_i)
      redirect to '/dashboard'
    else
      # TODO: Deny request
    end
  end

end
