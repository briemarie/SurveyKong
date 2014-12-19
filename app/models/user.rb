class User < ActiveRecord::Base
  has_many :created_surveys, foreign_key:"admin_id", class_name: "Survey"
  has_many :answers
  has_many :choices, through: :answers
  has_many :questions, through: :choices
  has_many :surveys, through: :questions
end

#comet