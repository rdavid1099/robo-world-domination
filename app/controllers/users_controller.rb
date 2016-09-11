class UsersController < Concerns::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:warzone, :new, :create]

  def warzone
    render file: '/public/welcome' unless logged_in?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      username_downcase
      session[:user_id] = @user.id
      redirect_to profile_path
    else
      flash_error
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path
    else
      flash_error
      render :edit
    end
  end

  def show
  end

  def destroy
    session[:user_id] = nil
    @user.destroy
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :birthday, :email, :username, :password, :password_confirmation, :avatar)
  end

  def set_user
    @user = current_user
  end

  def username_downcase
    @user.username.downcase!
    @user.save
  end
end
