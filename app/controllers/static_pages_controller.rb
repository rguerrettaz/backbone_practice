class StaticPagesController < ApplicationController
  # caches_page :index
  def index
    @tutorials = Tutorial.cached_all
  end
end
