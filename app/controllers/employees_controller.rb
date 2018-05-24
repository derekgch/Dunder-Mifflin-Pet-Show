class EmployeesController < ApplicationController
before_action :get_employee, only: [:show]

  def index
    @employees = Employee.all
  end

  def show
  end

  private

  def get_employee
    @employee = Employee.find(params[:id])
  end


end
