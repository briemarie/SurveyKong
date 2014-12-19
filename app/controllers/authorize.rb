use Rack::Flash

get '/' do
  @errors = flash[:error]
  erb :"auth/auth"
end
#----------- SESSIONS -----------

post '/users/new' do
  #This is a sign up authorization
  @new_user = User.create(params[:user])
  session[:user_id] = @new_user.id
  redirect "/profile/#{session[:user_id]}"
end

post '/sessions' do
  #This is a sign in authorization
  @user = User.find_by(email: params[:email])
  if @user
    if @user.authenticate?(params[:password])
      session[:user_id] = @user.id
      redirect "/profile/#{session[:user_id]}"
    end
  else
    flash[:error] = "Invalid Username or Password"
    redirect '/'
  end
  params
end


#This is a sign out
get '/logout' do
  session[:user_id] = nil
  redirect '/'
end


#----------- USERS -----------

#If signed in go to profile page
get '/profile' do
  redirect '/' unless session[:user_id]
  erb :"user/user"
end

