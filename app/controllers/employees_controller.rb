class EmployeesController < ApplicationController
before_action :get_employee, only: [:show, :edit, :update]

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
    if @employee.valid?
      redirect_to employee_path(@employee)
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to new_employee_path
    end
  end

  def edit
    @dogs = Dog.all
  end

  def update
    @employee.update(getparams)
    if @employee.valid?
      redirect_to employee_path
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_employee_path(@employee.id)
    end
  end

  private

  def get_employee
    @employee = Employee.find(params[:id])
  end

  def getparams
    params.require(:employee).permit(:first_name, :last_name, :title, :office, :alias, :img_url, :dog_id )
  end

end
