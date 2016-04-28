get '/' do
  # @auctions = Auction.all
  @active_auctions = Auction.where("start <= :start_date AND stop >= :end_date",{start_date: DateTime.now, end_date: DateTime.now})
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user
    if user.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect "/"
    else
      redirect '/login'
    end
  else
    redirect '/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end