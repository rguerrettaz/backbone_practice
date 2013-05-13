class StaticPagesController < ApplicationController
  caches_page :index
  def index
    @tutorials = Tutorial.all
  end
end
