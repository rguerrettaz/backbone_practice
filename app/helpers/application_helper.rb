module ApplicationHelper

  def vote_count(tutorial)
    sum = 0
    tutorial.votes.each do |vote|
      sum += vote.value
    end
    sum
  end

end
