class BranchProductsController < BranchDetailsController
  def index
    @products = branch.branch_products.includes product: :category
  end
end
