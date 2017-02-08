class Server < Sinatra::Base
  helpers Helpers
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    session[:start_date] = nil
    @spaces = Space.all
    erb :index
  end

  run! if app_file == $0

end
