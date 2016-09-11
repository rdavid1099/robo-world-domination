class WarsController < Concerns::BaseController
  include GameManager

  before_action :set_user
  before_action :set_war_params, only: [:round, :attack, :over]
  before_action :set_opponent, only: [:show, :challenge]
  before_action :set_war, only: [:show, :challenge]

  def index
    @opponents = User.all_except(@user)
  end

  def show
  end

  def challenge
  end

  def prep
    @opponent = Platoon.find(params[:opponent_platoon_id][:opponent].to_i).user
    cookies[:war_id] = War.create_or_find_stats(@user, @opponent).id
    cookies[:user_platoon_id] = params[:user_platoon_id][:user]
    cookies[:opponent_platoon_id] = params[:opponent_platoon_id][:opponent]
    redirect_to war_round_path, method: :get
  end

  def round
  end

  def attack
    calculate_attacks({war: @war, u_platoon: @u_platoon, o_platoon: @o_platoon})
    @u_platoon.reload
    @o_platoon.reload
    if @u_platoon.defeated? || @o_platoon.defeated?
      redirect_to war_endgame_path
    else
      render :round
    end
  end

  def over
    update_stats({war: @war, u_platoon: @u_platoon, o_platoon: @o_platoon})
    clear_war_cookies
  end

  private

  def set_user
    @user = current_user
  end

  def set_opponent
    @opponent = User.find(params[:id])
    redirect_to :index if current_user == @opponent
  end

  def set_war
    @war = War.create_or_find_stats(@user, @opponent)
  end

  def set_war_params
    @war = War.find(cookies[:war_id])
    @opponent = User.find(@war.opponent_id)
    @u_platoon = @user.platoons.find(cookies[:user_platoon_id])
    @o_platoon = @opponent.platoons.find(cookies[:opponent_platoon_id])
  end

  def clear_war_cookies
    cookies[:war_id] = nil
    cookies[:user_platoon_id] = nil
    cookies[:opponent_platoon_id] = nil
  end
end
