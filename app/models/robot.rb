class Robot < ApplicationRecord
  belongs_to :platoon
  belongs_to :division

  validates :name, presence: true
  validates :health, presence: true
  validates :avatar, presence: true
  validates :division_id, presence: true
  validates :platoon_id, presence: true

  before_validation :init

  def init
    self.avatar ||= generate_robo_avatar
    self.health ||= generate_health
    self.base_attack ||= generate_base_attack
  end

  def full_health
    self.health = generate_health
    self.save
  end

  def attack
    self.base_attack = generate_base_attack if self.base_attack.nil?
    base_attack + (rand(20)%3)
  end

  def crit_attack
    self.attack * 2
  end

  def injured?
    self.health < generate_health && self.health > 0
  end

  def dead?
    self.health <= 0
  end

  private

  def generate_robo_avatar
    "https://robohash.org/#{Time.now.to_s.gsub(" ", "")}"
  end

  def generate_health
    if self.division.unit_type == "Infantry"
      10
    elsif self.division.unit_type == "Medic"
      15
    elsif self.division.unit_type == "Ballistics"
      20
    else
      10
    end
  end

  def generate_base_attack
    if self.division.unit_type == "Infantry"
      2
    elsif self.division.unit_type == "Medic"
      1
    elsif self.division.unit_type == "Ballistics"
      4
    else
      3
    end
  end

end
