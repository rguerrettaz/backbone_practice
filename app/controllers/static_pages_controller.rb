class StaticPagesController < ApplicationController
  def index
    @tutorials = Tutorial.all
  end
end