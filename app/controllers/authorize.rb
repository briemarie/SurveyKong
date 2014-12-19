get '/' do
  erb :"auth/auth"
end

get '/users/:id' do
  @user = User.find(params[:id])
  @surveys = @user.surveys
  @created = @user.created_surveys
  erb :profile
end

get '/users/:id/surveys' do
  @user = User.find(params[:id])
  erb :_survey, layout: false
end

get '/users/:id/surveys/:survey_id' do
  @user = User.find(params[:id])
  @survey = Survey.find(params[:survey_id])
  erb :create_survey
end

get '/users/:id/surveys/:survey_id/questions' do
  @user = User.find(params[:id])
  @survey = Survey.find(params[:survey_id])
  erb :_question, layout: false
end

get '/users/:id/surveys/questions/:id/choices' do
  @user = User.find(params[:id])
  erb :_question, layout: false
end

# post '/users/:id/surveys/questions'do




post '/users/:id/surveys' do
  @user = User.find(params[:id])
  @survey = @user.created_surveys.create(title:params[:title])
  content_type :json
  {user: @user.id, survey: @survey.title}.to_json
  # redirect "/users/#{@user.id}"
end

# get '/test' do
#  "<form id='question' action='/test' method='post'>
#     <input type='text' name='testt[1][1]' placeholder='content'>
#     <input type='text' name='testt[2][1]' placeholder='content'>
#     <input type= 'submit' value='test submit'>
#   </form>"
# end
# post '/test' do
#   params[:testt]["1"]["1"].to_s
# end
