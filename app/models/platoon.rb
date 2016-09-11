class Platoon < ApplicationRecord
  has_many :robots
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :num_of_wins, presence: true
  validates :num_of_losses, presence: true

  before_validation :init

  def init
    self.num_of_wins ||= 0
    self.num_of_losses ||= 0
  end

  def injured_bots
    self.robots.reduce(0) do |result, robot|
      result += 1 if robot.injured?
      result
    end
  end

  def dead_bots
    self.robots.reduce(0) do |result, robot|
      result += 1 if robot.dead?
      result
    end
  end

  def defeated?
    self.robots.all? do |robot|
      robot.dead?
    end
  end
end
