class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :miniprofiler

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

  private

  def miniprofiler
    Rack::MiniProfiler.authorize_request
  end
end
