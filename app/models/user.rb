class User < ActiveRecord::Base
  has_secure_password

  has_many :gymvisits

  validates :name, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true

  enum role: %w(default admin)
end
