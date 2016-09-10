class Concerns::BaseController < ApplicationController
  before_action :require_login

  def require_login
    render file: '/public/404' unless logged_in?
  end

  def flash_error(target)
    flash.now[:error] = target.errors.full_messages.join(", ")
  end
end
