class Server < Sinatra::Base

  set :views, File.dirname(__FILE__) + '/views'
  helpers Helpers
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    @spaces = Space.all
    erb :index
  end

  run! if app_file == $0
  
end