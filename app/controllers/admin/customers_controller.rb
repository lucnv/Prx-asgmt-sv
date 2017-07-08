class Admin::CustomersController < Admin::BaseController
  def index
    @customers = Customer.includes(:branch)
  end
end
