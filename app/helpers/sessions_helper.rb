module SessionsHelper

  def sign_in(user)
    session[:id] = user.id
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    session.delete(:id)
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    return @current_user = nil unless session[:id]
    @current_user = User.cached_find(session[:id])
  end
end
