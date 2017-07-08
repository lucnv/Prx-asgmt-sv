class EmployeesController < BranchDetailsController
  def index
    @employees = branch.employees
  end
end
