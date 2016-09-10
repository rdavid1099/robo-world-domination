class PlatoonsController < Concerns::BaseController
  before_action :validate_id_number, only: [:show, :edit]
  before_action :set_platoon, only: [:show, :edit, :update, :destroy]

  def index
    @platoons = current_user.platoons
  end

  def show
  end

  def new
    @platoon = Platoon.new
  end

  def create
    @platoon = current_user.platoons.new(name: params[:platoon][:name])
    if @platoon.save
      redirect_to platoons_path
    else
      flash_error(@platoon)
      render :new
    end
  end

  def edit
  end

  def update
    @platoon.name = params[:platoon][:name]
    if @platoon.save
      redirect_to platoon_path(@platoon)
    else
      flash_error(@platoon)
      render :edit
    end
  end

  def destroy
    @platoon.destroy
    redirect_to platoons_path
  end

  private

  def validate_id_number
    if Platoon.find_by(id: params[:platoon_id]).nil?
      render file: '/public/404'
    end
  end

  def set_platoon
    @platoon = current_user.platoons.find(params[:id])
  end
end
