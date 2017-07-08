class BranchDetailsController < ApplicationController
  before_action :authenticate_user!, :authorize_branch

  layout "branch/application"

  def branch
    @branch ||= Branch.find params[:branch_id] || params[:id]
  end

  def authorize_branch
    unless current_user.admin?
      unless branch == current_user.branch
        flash[:danger] = "No permission"
        redirect_to root_path
      end
    end
  end
end
