class Vote < ActiveRecord::Base
  attr_accessible :value

  belongs_to :tutorial
  belongs_to :user
end
