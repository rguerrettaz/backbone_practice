class TutorialsController < ApplicationController
  respond_to :js, :html
  include VotesHelper

  def new
    @tutorial = Tutorial.new
  end

  def create
    tutorial = Tutorial.new(params[:tutorial])
    tutorial.user = current_user
    redirect_to new_tutorial_path and return unless tutorial.save
    flash[:success] = 'Tutorial created successfully!'
    redirect_to tutorial
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
