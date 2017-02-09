module Helpers
  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def format_date(date)
    DateTime.parse(date).strftime('%d-%m-%Y')
  end

  def format_price(price)
    '%.2f' % price
  end

  def user_data(user_id)
   User.first(:id => user_id)
  end

  def booking_data(booking_id)
    Booking.first(:id => booking_id)
  end

  def space_data(space_id)
    Space.first(:id => space_id)
  end


end
