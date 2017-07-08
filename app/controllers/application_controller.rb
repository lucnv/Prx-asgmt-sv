class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout "application"

  include SessionsHelper

  def authenticate_user!
    unless user_logged_in?
      flash[:warning] = "You need to log in first"
      redirect_to login_path
    end
  end
end
