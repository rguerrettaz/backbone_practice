class Vote < ActiveRecord::Base
  attr_accessible :vote_type

  belongs_to :tutorial
  belongs_to :user

end
