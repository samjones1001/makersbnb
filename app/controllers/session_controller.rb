class Server < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email].downcase, params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'/sessions/new'
    end
  end

  get '/sessions/logout' do
    session[:user_id] = nil
    redirect to '/'
  end

end
