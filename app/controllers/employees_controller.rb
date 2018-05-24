class EmployeesController < ApplicationController
before_action :get_employee, only: [:show]

  def index
    @employees = Employee.all
  end

  def show
  end
  
  def new
    @employee = Employee.new
    @dogs = Dog.all
  end

  def create
    @employee = Employee.create(getparams)
  end
  private

  def get_employee
    @employee = Employee.find(params[:id])
  end

  def getparams
    params.require(:employee).permit(:first_name, :last  , :office, :alias, )
  end

end
