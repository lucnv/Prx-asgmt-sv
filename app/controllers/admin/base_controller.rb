class Admin::BaseController < ApplicationController
  layout "admin/application"

  before_action :authenticate_user!, :require_admin_permission

  private
  def require_admin_permission
    unless current_user.admin?
      flash[:warning] = "No permission"
      redirect_to root_path
    end
  end
end
