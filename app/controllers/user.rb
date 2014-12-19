get '/profile/:id' do
  @id = params[:id]
erb :"user/user"
end


