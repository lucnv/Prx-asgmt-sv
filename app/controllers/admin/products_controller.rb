class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.with_total_quantity.includes(:category)
  end
end
