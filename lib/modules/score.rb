module Score
  extend self

  UPVOTE_WEIGHT = 1
  DOWNVOTE_WEIGHT = -1


  def Score(tutorial)
    Score.score(tutorial)
  end

  def score(tutorial)
    score_votes(get_votes(tutorial))
  end

  def get_votes(tutorial)
    tutorial.votes
  end

  def score_votes(votes)
    votes.map(&method(:weight)).inject(:+)
  end

  def weight(vote)
    vote.vote_type == :up ? UPVOTE_WEIGHT : DOWNVOTE_WEIGHT
  end
end

