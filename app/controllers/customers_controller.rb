class CustomersController < BranchDetailsController
  def index
    @customers = branch.customers
  end
end
