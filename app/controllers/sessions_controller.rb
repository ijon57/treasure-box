class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "User successfully authenticated"
    else
      flash.now.alert = "Invalid credentials"
      render :new
    end
  end
end
