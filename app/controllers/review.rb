
get '/survey/:id/results' do
  @survey = Survey.find(params[:id])
  erb :"review/review"
end
