class Admin::EmployeesController < Admin::BaseController
  def index
    @employees = Employee.includes(:branch)
  end
end
