class CustomersController < BranchDetailsController
  before_action :authorize_branch
  def index
    @customers = branch.customers
  end
end
