class Server < Sinatra::Base


 get '/booking/bookings' do
  erb :'/booking/bookings'
 end

 # get 'booking/bookings' do
 #   @space = Space.all
 #   @user = User.all
 # end

end
