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
end