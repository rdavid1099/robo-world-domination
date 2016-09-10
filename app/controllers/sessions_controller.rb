class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:sessions][:username].downcase)
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      redirect_to profile_path
    else
      flash.now[:error] = "Username or Password does not match our records."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
