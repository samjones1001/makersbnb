class Server < Sinatra::Base

  post '/spaces/search' do
    session[:start_date] = params[:start_date]
    session[:end_date] = params[:end_date]
    @date_range = session[:start_date]..session[:end_date]
    @spaces = Space.all
    erb :index
  end

  get '/spaces/' do
    session[:request_id] = params[:request].to_i if params[:request]==nil
    @space = Space.first(:id => session[:request_id])
    erb :'spaces/query'
  end

  get '/spaces/new' do
    erb(:'/spaces/new')
  end

  post '/spaces/edit' do
    session[:space_id] = params[:spaceid]
    session[:space_name] = params[:name]
    session[:space_description] = params[:description]
    session[:space_price_per_night] = params[:price_per_night]
    session[:available_from] = params[:available_from]
    session[:available_to] = params[:available_to]
    redirect to('/spaces/update')
  end

  get '/spaces/update' do
    @space_id = session[:space_id]
    @space_name = session[:space_name]
    @space_description = session[:space_description]
    @space_price_per_night = session[:space_price_per_night]
    @space_available_from = session[:available_from]
    @space_available_to = session[:available_to]
    erb(:'/spaces/update/update_form')
  end

  post '/spaces/update' do

    @space_old = Space.get(params[:spaceid].to_i)

    date_range = @space_old.start_date..@space_old.end_date
    old_available_dates = Availabledate.all(:space_id => params[:spaceid].to_i, :date => date_range)
    old_available_dates.destroy

    @space_old.update(:name => params[:name], :description => params[:description], :price_per_night => params[:price_per_night].to_f, :start_date => params[:available_from], :end_date => params[:available_to])
    new_available_dates = (params[:available_from]..params[:available_to])
    new_available_dates.each do |i|
      Availabledate.create(date: i, available: true, space_id: params[:spaceid].to_i)
    end

    @space_new = Space.get(params[:spaceid].to_i)

    erb(:'/spaces/update/confirm')

  end

  get '/spaces/update/confirm' do
    erb(:'/spaces/update/confirm')
  end

  post '/spaces' do
    @space = Space.create(
    name: params[:name],
    description: params[:description],
    start_date: params[:available_from],
    end_date: params[:available_to],
    price_per_night: params[:price_per_night],
    image: params[:image],
    user_id: current_user.id)

    date_from  = Date.parse(params[:available_from])
    date_to  = Date.parse(params[:available_to])
    date_array = (date_from..date_to)

    if @space.save
      date_array.each do |i|
        Availabledate.create(date: i, available: true, space_id: @space.id)
      end
      redirect to('/')
    else
      erb(:'/spaces/new')
    end
  end


end
