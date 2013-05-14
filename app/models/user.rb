class User < ActiveRecord::Base
  attr_accessible :email, :password, :username
  has_secure_password
  before_save :downcase_email

  has_many :tutorials
  has_many :votes, foreign_key: "voter_id"

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def self.cached_find(id)
    Rails.cache.fetch([name, id]) { find(id) }
  end

  private

  def downcase_email
    self.email = self.email.downcase
  end
end
