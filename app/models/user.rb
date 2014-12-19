class User < ActiveRecord::Base
  has_many :created_surveys, foreign_key:"admin_id", class_name: "Survey"
  has_many :answers
  has_many :choices, through: :answers
  has_many :questions, through: :choices
  has_many :surveys, through: :questions


  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate?(entered_password)
    self.password == entered_password
  end
end

