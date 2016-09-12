class Admin::UsersController < Admin::BaseController

  def options
  end

  def index
    @users = User.all
  end

  def show

  end

  def new

  end


  def create

  end

  def edit

  end

  def update

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

end
