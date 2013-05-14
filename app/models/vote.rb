class Vote < ActiveRecord::Base
  attr_accessible :vote_type

  belongs_to :tutorial, touch: true
  belongs_to :user

  after_commit :flush_cache

  def flush_cache
    Rails.cache.delete([tutorial_id, voter_id])
  end

  def cache
    Rails.cache.fetch([tutorial_id, voter_id]) { vote_type }
  end

end
