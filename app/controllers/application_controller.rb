class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :miniprofiler

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

  def create_or_update_vote(tutorial, vote_type)
    vote = tutorial.cached_vote?(vote_type, current_user.id)

    unless vote
      vote = tutorial.votes.find_or_create_by_tutorial_id_and_voter_id(tutorial.id, current_user.id)
      vote.vote_type = vote_type
      vote.save
      vote.cache
    end
    return vote
  end

  # Needs to come out of the application controller and go into # the score module. Need help doing this.
  UPVOTE_WEIGHT = 1
  DOWNVOTE_WEIGHT = -1

  def score(tutorial)
    score_votes(get_votes(tutorial))
  end

  def get_votes(tutorial)
    tutorial.cached_votes
  end

  def score_votes(votes)
    votes.map(&method(:weight)).inject(:+)
  end

  def weight(vote)
    vote.vote_type == "up" ? UPVOTE_WEIGHT : DOWNVOTE_WEIGHT
  end

  # helper_method :Score.instance_methods

  private

  def miniprofiler
    Rack::MiniProfiler.authorize_request
  end
end
