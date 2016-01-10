class User < ActiveRecord::Base
  has_secure_password

  has_many :gymvisits

  validates :name, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true

  enum role: %w(default admin)

  def update_total_points(redeemable_points)
    new_points = redeemable_points.to_i - self.total_points
    self.total_points = self.total_points + new_points
  end

end
