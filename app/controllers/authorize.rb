get '/' do
  erb :"auth/auth"
end

post '/' do
  if authorized
  redirect erb :"auth/auth/profile"
  end
end
