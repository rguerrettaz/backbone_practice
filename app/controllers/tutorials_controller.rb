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
  end

  def vote
    @tutorial = Tutorial.find(params[:format].to_i)
    create_or_update_vote(@tutorial, vote_value(params[:type]))
    render json: { vote_count: vote_count(@tutorial) }
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