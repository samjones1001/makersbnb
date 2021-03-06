class Server < Sinatra::Base

  get '/users/new' do
    	@user = User.new
    	erb :'users/new'
  end

  get '/users' do
    redirect to '/request'
  end

  post '/users' do
    @user = User.create(email: params[:email].downcase,
    				            name: params[:name],
                        username: params[:username],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
    	session[:user_id] = @user.id
   	  redirect to('/')
    else
    	flash.now[:errors] = @user.errors.full_messages
    	erb :'users/new'
    end
  end

end
