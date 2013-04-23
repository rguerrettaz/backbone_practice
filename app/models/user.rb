class User < ActiveRecord::Base
  attr_accessible :email, :password, :username
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

end
