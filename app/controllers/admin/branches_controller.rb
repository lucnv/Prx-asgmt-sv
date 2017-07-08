class Admin::BranchesController < Admin::BaseController
  def index
    @branches = Branch.all
  end
end
