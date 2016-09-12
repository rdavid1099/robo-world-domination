class RobotsController < Concerns::BaseController
  before_action :validate_id_number, only: [:show, :edit]
  before_action :set_robot, only: [:show, :edit, :update, :destroy, :heal]
  before_action :set_divisions, only: [:edit, :update, :new, :create]
  before_action :set_platoon

  def index
  end

  def show
  end

  def new
    @robot = Robot.new
  end

  def create
    @robot = @platoon.robots.new(robot_params)
    if @robot.save
      redirect_to platoon_path(@platoon)
    else
      flash_error(@robot)
      render :new
    end
  end

  def edit
    @platoons = current_user.platoons
  end

  def update
    @platoons = current_user.platoons
    if @robot.update(robot_update_params)
      redirect_to platoon_robot_path(@platoon, @robot)
    else
      flash_error(@robot)
      render :edit
    end
  end

  def destroy
    @robot.destroy
    redirect_to platoon_path(@platoon)
  end

  def heal
    @robot.full_health
    redirect_to platoon_robot_path(@platoon, @robot)
  end

  private

  def robot_params
    params.require(:robot).permit(:name, :division_id)
  end

  def robot_update_params
    {name: params[:robot][:name],
     health: @robot.health,
     avatar: @robot.avatar,
     division_id: params[:robot][:division_id],
     platoon_id: params[:robot][:platoon_id]}
  end

  def set_robot
    @robot = Robot.find(params[:id])
  end

  def set_platoon
    @platoon = Platoon.find(params[:platoon_id])
  end

  def set_divisions
    @divisions = Division.all
  end

  def validate_id_number
    if current_user.robots.find_by(id: params[:id]).nil? || current_user.platoons.find_by(id: params[:platoon_id]).nil?
      render file: '/public/404'
    end
  end

end
