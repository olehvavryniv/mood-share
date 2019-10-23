class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end

  def authenticate_user
    redirect_to authenticate_path if current_user.blank?
  end

  def authenticate_path
    root_path
  end
end
