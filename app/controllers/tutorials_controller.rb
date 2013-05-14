class TutorialsController < ApplicationController
  respond_to :js, :html
  include VotesHelper

  def new
    @tutorial = Tutorial.new
  end

  def create
    tutorial = Tutorial.new(params[:tutorial])
    tutorial.user = current_user
    if tutorial.save
      flash[:success] = 'Tutorial created successfully!'
      redirect_to tutorial
    else
      render new_tutorial_root
    end
  end

  def show
    @tutorial = Tutorial.cached_find(params[:id])
    @score =  score(@tutorial)
  end

  def vote
    tutorial = Tutorial.cached_find(params[:id])
    vote_checker(tutorial, params[:type])
    render json: { vote_count: score(tutorial) }
  end
end
