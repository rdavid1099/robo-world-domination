class Division < ApplicationRecord
  has_many :robots
  validates :unit_type, presence: true, uniqueness: true
end
