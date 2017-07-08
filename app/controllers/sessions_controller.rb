class SessionsController < ApplicationController
  before_action :check_logged_in, only: [:new, :create]
  def new
  end

  def create
    session_params = params.require :session
    if user = User.valid_login?(session_params[:email], session_params[:password])
      log_in user
      flash[:success] = "Login successful"
      redirect_after_logged_in
    else
      flash.now[:danger] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    authenticate_user!
    log_out
    flash[:warning] = "Logged out!"
    redirect_to root_path
  end

  private
  def check_logged_in
    if user_logged_in?
      flash[:warning] = "Logged in!"
      redirect_to root_path
    end
  end

  def redirect_after_logged_in
    if current_user.admin?
      redirect_to admin_root_path
    else
      redirect_to root_path
    end
  end
end
