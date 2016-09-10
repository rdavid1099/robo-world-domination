class Robot < ApplicationRecord
  belongs_to :platoon
  belongs_to :division

  validates :name, presence: true, uniqueness: true
  validates :health, presence: true
  validates :avatar, presence: true
  validates :division_id, presence: true
  validates :platoon_id, presence: true

  before_validation :init

  def init
    self.avatar ||= generate_robo_avatar
    self.health ||= generate_health
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

end
