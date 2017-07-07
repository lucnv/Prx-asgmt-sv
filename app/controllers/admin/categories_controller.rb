class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all.page(params[:page]).per 10
  end
end
