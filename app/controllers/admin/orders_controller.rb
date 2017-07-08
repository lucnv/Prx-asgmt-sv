class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.recent_created.includes(:branch, :customer, :employee)
      .page(params[:page]).per 20
  end

  def show
    @order = Order.find params[:id]
  end
end
