class Admin::BaseController < Concerns::BaseController
  before_action :validate_admin

  def validate_admin
    render file: "/public/404" unless logged_in? && is_admin?
  end
end
