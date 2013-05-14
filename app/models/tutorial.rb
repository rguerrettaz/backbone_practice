class Tutorial < ActiveRecord::Base
  attr_accessible :content, :title

  belongs_to :user
  has_many :votes

  validates :title, presence: true
  validates :content, presence: true

  after_commit :flush_cache

  def self.cached_all
    Rails.cache.fetch([name]) { all }
  end

  def self.cached_find(id)
    Rails.cache.fetch([name, id]) { find(id) }
  end

  def flush_cache
    Rails.cache.delete([self.class.name])
  end

  def cached_votes
    @votes ||= self.votes
  end

  def cached_vote?(vote_type, uid)
    Rails.cache.fetch([id, uid]) == vote_type
  end


end
