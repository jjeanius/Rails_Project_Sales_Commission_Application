require 'pry'
class EmployeesController < ApplicationController

 def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new(employee_params)
  end

  def create
    @employee = Employee.new(employee_params)
      if @employee.save
        session[:employee_id] = @employee.id
          redirect_to employee_path(@employee)
      else
        render :new
      end
  end

  def show
    set_employee
  end

  def edit
    set_employee
  end

  def update
    set_employee
      if @employee.update(employee_params)
        redirect_to @employee
      else
        render :edit
    end
  end

  def destroy
    set_employee.destroy  #  session[employee_id].destroy
    redirect_to root_path
  end

  def region
    @employee = Employee.region
  end

private

  def set_employee
    @employee = Employee.find_by(id: params[:id])
      if !@employee
        redirect_to employees_path
      end
  end


  def employee_params
    params.require(:employee).permit(:name, :region, :position, :email, :password, :password_confirmation, :password_digest, :admin)
  end

end

