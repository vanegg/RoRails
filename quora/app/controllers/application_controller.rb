class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if session[:id]
      @current_user ||= User.find_by_id(session[:id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  helper_method :current_user, :logged_in?
end
