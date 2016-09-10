class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    @user ||= User.find(session[:user_id]) unless session[:user_id].nil?
  end

  def logged_in?
    !current_user.nil?
  end

end
