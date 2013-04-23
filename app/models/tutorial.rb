class Tutorial < ActiveRecord::Base
  attr_accessible :content, :title

  belongs_to :user
  has_many :votes

  validates :title, presence: true
  validates :content, presence: true

end
