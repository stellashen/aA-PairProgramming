class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def log_in(user)
    user.reset_session_token
    session[:session_token] = user.session_token
    redirect_to subs_url
  end

  def log_out
    current_user.reset_session_token
    session[:session_token] = nil
    redirect_to new_session_url
  end

  def require_log_in!
    redirect_to new_session_url unless logged_in?
  end

  def ensure_moderator
    current_user.subs.find(params[:id])
  end
end
