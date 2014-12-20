require 'faker'
new_survey= Survey.create(title: "Favorites")

3.times do
  new_question = Question.create(content: Faker::Company.catch_phrase)
  rand(3..5).times do
    new_choice = Choice.create(content: Faker::Company.name)
    rand(5..25).times do
      new_choice.answers << Answer.create
    end
    new_question.choices << new_choice
  end
  new_survey.questions << new_question
end

