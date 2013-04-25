class TutorialsController < ApplicationController
  respond_to :js, :html

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
    @tutorial = Tutorial.find(params[:id])
    @score =  score(@tutorial)
  end

  def vote
    @tutorial = Tutorial.find(params[:id])
    create_or_update_vote(@tutorial, params[:type])

    render json: { vote_count: score(@tutorial) }
  end
end
