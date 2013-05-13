class TutorialsController < ApplicationController
  respond_to :js, :html
  caches_page :show

  def new
    @tutorial = Tutorial.new
  end

  def create
    tutorial = Tutorial.new(params[:tutorial])
    tutorial.user = current_user
    # Resets cache for index page
    expire_page action: :index, controller: "static_pages"
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
    # Resets cache for tutorial/:id
    expire_page action: :show
    render json: { vote_count: score(@tutorial) }
  end
end
