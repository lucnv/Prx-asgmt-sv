class OrdersController < BranchDetailsController
  def index
    @orders = branch.orders.recent_created.includes(:customer, :employee)
      .page(params[:page]).per 20
  end

  def show
    @order = @branch.orders.find params[:id]
  end
end
