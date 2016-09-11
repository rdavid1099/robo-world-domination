class War < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :opponent_id, presence: true

  before_validation :init

  def self.create_or_find_stats(user, opponent)
    if War.where(user_id: user.id, opponent_id: opponent.id).empty?
      create_war(user, opponent)
    else
      War.where(user_id: user.id, opponent_id: opponent.id).first
    end
  end

  private

  def init
    self.wins ||= 0
    self.losses ||= 0
  end

  def self.create_war(user, opponent)
    self.create(user_id: user.id, opponent_id: opponent.id)
  end
end
