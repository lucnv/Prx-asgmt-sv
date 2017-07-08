class SessionsController < ApplicationController
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
    redirect_to root_path
  end

  private
  def redirect_after_logged_in
    if current_user.admin?
      redirect_to admin_root_path
    else
      redirect_to root_path
    end
  end
end
