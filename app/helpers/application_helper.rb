module ApplicationHelper
  def display_nav_bar
    if logged_in?
      "#{link_to current_user.username.capitalize, profile_path} | #{link_to "Log Out", logout_path}"
    else
      "#{link_to "Log In", login_path} | #{link_to "Create Account", new_user_path}"
    end
  end
end
