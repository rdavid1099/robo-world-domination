class User < ApplicationRecord
  has_secure_password
  has_many :wars
  has_many :platoons
  has_many :robots, through: :platoons

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :name, presence: true
  validates :birthday, presence: true
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
  validates :password, confirmation: true
  validates_length_of :password, in: 6..20, on: :create
  validates :avatar, presence: true

  enum role: ["default", "admin"]
  after_initialize :init

  def init
    self.avatar ||= "default_avatar.jpg"
  end

  def since_last_login
    ((Time.now - self.updated_at.to_time)/1.day).ceil
  end

  def wins
    return 0 if self.platoons.empty?
    self.platoons.reduce(0) {|result, platoon| result += platoon.num_of_wins.to_i}
  end

  def losses
    return 0 if self.platoons.empty?
    self.platoons.reduce(0) {|result, platoon| result += platoon.num_of_wins.to_i}
  end

  def num_of_injured_bots
    return 0 if self.robots.empty?
    self.platoons.reduce(0) {|result, platoon| result += platoon.injured_bots}
  end

  def num_of_dead_bots
    return 0 if self.robots.empty?
    self.platoons.reduce(0) {|result, platoon| result += platoon.dead_bots}
  end

  def self.all_except(user)
    where.not(id: user.id)
  end
end
