module GameManager
  def update_stats(params)
    war = params[:war]
    u_platoon = params[:u_platoon]
    o_platoon = params[:o_platoon]
    o_war = War.create_or_find_stats(o_platoon.user, u_platoon.user)
    if u_platoon.defeated?
      war.losses += 1
      o_war.wins += 1
      u_platoon.num_of_losses += 1
      o_platoon.num_of_wins += 1
    else
      o_war.losses += 1
      war.wins += 1
      o_platoon.num_of_losses += 1
      u_platoon.num_of_wins += 1
    end
    war.save
    o_war.save
    u_platoon.save
    o_platoon.save
  end

  def calculate_attacks(params)
    war = params[:war]
    u_platoon = params[:u_platoon]
    o_platoon = params[:o_platoon]
    platoon_attack(u_platoon, o_platoon)
    platoon_attack(o_platoon, u_platoon)
  end

  def platoon_attack(platoon, enemy_platoon)
    total_attack = calculate_platoon_attack(platoon.robots)
    target_robots(total_attack, enemy_platoon)
  end

  def calculate_platoon_attack(robots)
    robots.reduce(0) do |result, robot|
      result += calculate_robot_attack(robot)
    end
  end

  def calculate_robot_attack(robot)
    chance_to_hit = 1 + rand(20)
    if chance_to_hit == 20
      robot.crit_attack
    elsif chance_to_hit > rand(15)
      robot.attack
    else
      0
    end
  end

  def target_robots(attack, enemy_platoon)
    enemy_robots = enemy_platoon.robots
    div_attack = set_div_attack(enemy_robots.count, attack)
    enemy_robots.each_with_index do |robot, index|
      robot.health -= attack[index] unless robot.dead?
      robot.save
    end
  end

  def set_div_attack(num_enemy_robots, attack)
    div_attack = Array.new(num_enemy_robots, 0)
    div_attack.map do |a|
      a += (attack -= rand(attack)) unless attack.zero?
    end
  end
end
