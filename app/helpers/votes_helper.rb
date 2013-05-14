module VotesHelper

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

   def vote_checker(tutorial, vote_type)
    unless tutorial.cached_vote?(vote_type, current_user.id)
      create_or_update_vote(tutorial, vote_type)
    end
  end

  def create_or_update_vote(tutorial, vote_type)
    tutorial.votes.find_or_initialize_by_tutorial_id_and_voter_id(tutorial.id, current_user.id).tap do |v|
      v.vote_type = vote_type
    end.save!


  end

end
