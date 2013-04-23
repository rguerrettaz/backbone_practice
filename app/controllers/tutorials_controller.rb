class TutorialsController < ApplicationController

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
  end

  def vote
    create_or_update_vote(Tutorial.find(params[:format].to_i), vote_value(params[:type]))
    redirect_to :back
  end
end


 # Leaving this here to ask instructor about above refactor
 
 # def vote
 #    tutorial_id = params[:format].to_i
 #    vote_value = params[:type] == "up" ? 1 : -1
 #    @tutorial = Tutorial.find(tutorial_id)
 #    create_or_update_vote(@tutorial, vote_value)
 #    redirect_to :back
 #  end