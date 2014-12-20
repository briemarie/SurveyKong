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
  @questions = @survey.questions
  erb :create_survey
end

get '/users/:id/surveys/:survey_id/questions' do
  @num_of_questions = params[:num]
  @user = User.find(params[:id])
  @survey = Survey.find(params[:survey_id])
  erb :_question, layout: false
end

get '/users/:id/surveys/:survey_id/choices' do
  @num_of_questions = params[:q]
  @num_of_choices = params[:c]
  @user = User.find(params[:id])
  @survey = Survey.find(params[:survey_id])
  erb :_choice, layout: false
end

post '/users/:id/surveys/:survey_id/questions' do
  @user = User.find(params[:id])
  @survey = Survey.find(params[:survey_id])
  @question = @survey.questions.create(content:params[:content])
  content_type :json
  {content: @question.content}.to_json
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
  redirect "/users/#{@user.id}/surveys/#{@survey.id}"
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
