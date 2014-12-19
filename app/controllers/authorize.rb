#----------- SESSIONS -----------

get '/' do
  erb :"auth/auth"
end

#Confused about how to direct these since we are using a modal ...
post '/' do
  #This is a sign up authorization
  @new_user = User.create(params[:user])
  session[:user_id] = @new_user.id
  #This is a sign in authorization
  @user = User.find_by(email: params[:email])
  if @user.authenticate?(params[:password])
    session[:user_id] = @user.id
    redirect '/profile'
  end
  erb :"auth/auth"
end

#This is a sign out
delete '/' do
  session[:user_id] = nil
  redirect '/'
end


#----------- USERS -----------

#If signed in go to profile page
get '/profile' do
  redirect '/' unless session[:user_id]
  erb :"user/user"
end

