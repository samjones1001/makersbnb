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
    p current_user.id
    @user_spaces = Space.all(:user_id => current_user.id)
    # @array_of_space_ids = []
    # @user_spaces.each do |space|
    #   @array_of_space_ids.push(space.id)
    # end
    # p @array_of_space_ids
    #
    # @space_dates_per_id = []
    # @array_of_space_ids.each do |space_id|
    #   @space_dates_per_id.push(Availabledate.all(:space_id => space_id))
    # end
    # p @space_dates_per_id.flatten!
    # @array_of_dates = []
    #
    # @space_dates_per_id.each do |date_obj|
    #   @array_of_dates.push(date_obj.date)
    # end
    # p @array_of_dates
    erb(:'/spaces/update/user_spaces')
  end

  post '/spaces/edit' do
    session[:space_id] = params[:spaceid]
    session[:space_name] = params[:name]
    session[:space_description] = params[:description]
    session[:space_price_per_night] = params[:price_per_night]
    redirect to('/spaces/update')
  end

  get '/spaces/update' do
    @space_id = session[:space_id]
    @space_name = session[:space_name]
    @space_description = session[:space_description]
    @space_price_per_night = session[:space_price_per_night]
    erb(:'/spaces/update/update_form')
  end

  post '/spaces/update' do
    @space_id = params[:spaceid].to_i
    @space_name_new = params[:name]
    @space_description_new = params[:description]
    @space_price_per_night_new = params[:price_per_night].to_f
    @space = Space.get(@space_id)
    @space_name_old = @space.name
    @space_description_old = @space.description
    @space_price_per_night_old = @space.price_per_night

    @space.update(:name => @space_name_new, :description => @space_description_new, :price_per_night => @space_price_per_night_new)

      erb(:'/spaces/update/confirm')

  end

  get '/spaces/update/confirm' do
    erb(:'/spaces/update/confirm')
  end

  post '/spaces' do
    @space = Space.create(
    name: params[:name],
    description: params[:description],
    price_per_night: params[:price_per_night],
    image: params[:image], user_id: current_user.id)

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
