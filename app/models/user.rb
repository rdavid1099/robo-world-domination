class User < ApplicationRecord
  has_secure_password
  has_many :platoons

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
end
