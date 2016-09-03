class Record < ApplicationRecord
  validates :num_of_wins,   presence: true
  validates :num_of_losses, presence: true

  after_initialize :init

  def init
    self.num_of_wins   ||= 0
    self.num_of_losses ||= 0
  end
end
