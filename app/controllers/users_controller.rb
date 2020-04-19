class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def create 
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    response_text = "Hey, a new user is created with the id #{new_user.id}"
    render plain: response_text
  end

  def create_login
    email = params[:email]
    password = params[:password]
    user = User.find_by "email = ? and password = ?", email, password
    if (user)
      render plain: "true"
    else
      render plain: "false"
    end
  end

end
