get '/users/new' do
  erb :'/users/new'
end

post '/users/new' do
  user = User.create(user_name: params[:user_name], email: params[:email], password: params[:password])
  session[:user_id] = user.id
  redirect "/users/#{user.id}"
end

# Show specific users page if logged in, redirect otherwise
get '/users/:id' do
  if current_user
    @user = User.find(params[:id])
    erb :'/users/show'
  else
    redirect '/login'
  end
end

get '/users/:user_id/airmaps/new' do
  if current_user
    @user = User.find(params[:user_id])
    erb :'/airmaps/new'
  else
    redirect '/login'
  end
end

# get params from a from to create a specific user 'x' (say post) and redirect accordingly
post '/users/:user_id/airmaps' do
  if current_user
    lat_lon = convert_address(params[:address])
    lat = lat_lon.split(",")[0]
    lon = lat_lon.split(",")[1]
    api_response = call_api(lat_lon)

    # @airmap = Airmap.create(user_id: session[:user_id], address: params[:address], lat: lat, lon: lon, report: api_response.parsed_response)
    # puts "****************************"
    # puts "Airmap is: #{@airmap}"
    # puts "****************************"
    redirect "/users/#{session[:user_id]}"
  else
    redirect '/login'
  end
end

get "/users/:user_id/airmaps/:id" do
  if current_user
    @airmap = Airmap.find(params[:id])
    lat_lon = convert_address(@airmap.address)
    @lat = lat_lon.split(",")[0]
    @lon = lat_lon.split(",")[1]
    erb :'/airmaps/show'
  else
    redirect '/login'
  end
end













# ______________________________________________________

# # get params from a from to create a specific user 'x' (say post) and redirect accordingly
# post '/users/:id/airmaps' do
#   if current_user
#     airmap = airmap.create(user_id: params[:id], name: params[:name], description: params[:description], start: params[:start_date], stop: params[:stop_date], price: params[:price])
#     redirect "/users/#{params[:id]}"
#   else
#     redirect '/login'
#   end
# end


# get '/users/:id/airmaps/:airmap_id' do
#   if current_user
#     @user = User.find(params[:id])
#     @airmap = Airmap.find(params[:airmap_id])
#     erb :'/airmaps/show'
#   else
#     redirect '/login'
#   end
# end

# # show form to edit an 'x' by user (say a post)
# get '/users/:id/airmaps/:airmap_id/edit' do
#     if current_user
#       @user = User.find(params[:id])
#       @airmap = Airmap.find(params[:airmap_id])
#       erb :'/airmaps/edit'
#     else
#       redirect '/login'
#     end
# end

# # Get data from a form to edit a certain users specific 'x' (say post) checking if logged in and redirecting accordingly
# put '/users/:id/airmaps/:airmap_id' do
#     if current_user
#       airmap = Airmap.find(params[:airmap_id])
#       airmap.update_attributes(user_id: params[:id], name: params[:name], description: params[:description], start: params[:start_date], stop: params[:stop_date], price: params[:price])
#       redirect "/users/#{params[:id]}"
#     else
#       redirect '/login'
#     end
# end

# # Delete a certain users specific 'x' (say post) checking if logged in and redirecting accordingly
# delete '/users/:id/airmaps/:airmap_id' do
#     if current_user
#       airmap = Airmap.find(params[:airmap_id])
#       airmap.destroy
#       redirect "/users/#{params[:id]}/airmaps"
#     else
#       redirect '/login'
#     end
# end

# # Show specific user edit form if logged in, redirect otherwise
# get '/users/:id/edit' do
#   if current_user
#     @user = User.find(params[:id])
#     erb :'/users/edit'
#   else
#     redirect '/login'
#   end
# end

# # Get params from user edit form and update profile if logged in and redirect, redirect if not logged in
# put '/users/:id' do
#   if current_user
#     user = User.find(params[:id])
#     user.update_attributes(name: params[:name], email: params[:email], password: params[:password])
#     erb :'/users/show'
#   else
#     redirect '/login'
#   end
# end

# # Get params from user delete button/link and destroy user, and redirect accordingly
# delete '/users/:id' do
#   if current_user
#     user = User.find(params[:id])
#     session.clear
#     user.destroy
#     redirect '/'
#   else
#     redirect '/login'
#   end
# end

# # show all 'x' by user (say posts)
# get '/users/:id/posts' do
#     if current_user
#       @user = User.find(params[:id])
#       @posts = @user.posts
#       erb :'/users/posts'
#     else
#       redirect '/login'
#     end
# end







# #create a post, must be logged in
# get '/users/:id/posts/new' do
#   if current_user
#     @user = User.find(params[:id])
#     erb :'/posts/new'
#   else
#     redirect '/login'
#   end
# end

# # take params from the create new user form and create new user, redirect accordingly
# post '/users/new' do
#   user = User.create(name: params[:name], email: params[:email], password: params[:password])
#   session[:user_id] = user.id
#   redirect "/"
# end

# # get params from a from to create a specific user 'x' (say post) and redirect accordingly
# post '/users/:id/posts' do
#   if current_user
#     post = Post.create(title: params[:title], content: params[:content])
#     redirect "/"
#   else
#     redirect '/login'
#   end
# end
