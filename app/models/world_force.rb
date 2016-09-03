class WorldForce < ApplicationRecord
  after_initialize :init

  def init
    self.total_wars_waged ||= 0
  end
end
