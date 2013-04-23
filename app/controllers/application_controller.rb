class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

  def create_or_update_vote(tutorial, value)
    vote = tutorial.votes.find_or_create_by_tutorial_id_and_user_id(tutorial.id, current_user.id)
    vote.value = value
    vote.save
  end

  def vote_value(vote_type)
    vote_type == "up" ? 1 : -1
  end
    
end