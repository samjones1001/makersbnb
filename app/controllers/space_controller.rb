class Server < Sinatra::Base

  post '/spaces/search' do
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @date_range = @start_date..@end_date
    @spaces = Space.all
    erb :index
  end

  get '/spaces/' do
    @request_id = params[:request].to_i
    @space = Space.first(:id => @request_id)
    erb :'spaces/query'
  end

  get '/spaces/new' do
    erb(:'/spaces/new')
  end

  get '/spaces/edit' do
    current_user.id
    @user_spaces = Space.all(:user_id => current_user.id)
    erb(:'/spaces/update/user_spaces')
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
    @space_id = params[:spaceid].to_i
    @space_name_new = params[:name]
    @space_description_new = params[:description]
    @space_price_per_night_new = params[:price_per_night].to_f
    @space_available_from_new = params[:available_from]
    @space_available_to_new = params[:available_to]

    @space = Space.get(@space_id)

    @space_name_old = @space.name
    @space_description_old = @space.description
    @space_price_per_night_old = @space.price_per_night
    @space_available_from_old = @space.start_date
    @space_available_to_old = @space.end_date

    @date_range = @space_available_from_old..@space_available_to_old

    @old_available_dates = Availabledate.all(:space_id => @space_id, :date => @date_range)

    @old_available_dates.destroy

    @space.update(:name => @space_name_new, :description => @space_description_new, :price_per_night => @space_price_per_night_new, :start_date => @space_available_from_new, :end_date => @space_available_to_new)

    @new_available_dates = (@space_available_from_new..@space_available_to_new)

    @new_available_dates.each do |i|
      Availabledate.create(date: i, available: true, space_id: @space_id)
    end

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
