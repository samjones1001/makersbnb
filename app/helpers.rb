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

  def user_spaces(user_id = current_user.id)
    Space.all(:user_id => user_id)
  end

  def booking_data(booking_id)
    Booking.first(:id => booking_id)
  end

  def space_data(space_id)
    Space.first(:id => space_id)
  end

  def dates_available_for_space(space_id)
    Availabledate.all(:space_id => space_id)
  end

  def able_to_book(space_id)
    available_spaces = dates_available_for_space(space_id)
    available_spaces.each do |space|
      return false if space.available == false
    end
    return true
  end

  def confirm_booking(booking_id)
    booking = booking_data(booking_id)
    date_range = booking.from_date.to_s..booking.to_date.to_s
    date_range.each do |date|
      change_date = Availabledate.first(:space_id => booking.space_id, :date => date)
      change_date.update(:available => false)
    end
    booking.update(:hired => true)
  end

  def cost_of_space(from, to, price)
    date_range = from..to
    days = 0
    date_range.each{|x| days+=1}
    price * days
  end

  def logged_in?
    !current_user.nil?
  end

end
