class Server < Sinatra::Base


 get '/request' do
   @confirmtion = Confiramtion.all
   @user = User.all
  erb :'/request/confirmation'
 end


end
