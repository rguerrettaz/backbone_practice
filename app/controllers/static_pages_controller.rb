class StaticPagesController < ApplicationController

  def index
    @tutorials = Tutorial.cached_all
  end

end
