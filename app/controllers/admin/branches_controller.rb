class Admin::BranchesController < Admin::BaseController
  def index
    @branches = Branch.page(params[:page]).per 10
  end
end
