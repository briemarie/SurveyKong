class Survey < ActiveRecord::Base
  belongs_to :admin, class_name:"User"
  has_many :questions
  has_many :choices, through: :questions
  has_many :answers, through: :choices
  has_many :users, through: :answers
end
