class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.all.includes(:category).page(params[:page]).per 10
  end
end
