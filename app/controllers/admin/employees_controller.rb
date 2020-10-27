class Admin::EmployeesController < Admin::AdminController
  before_action :set_employee, only: [:edit, :update, :show, :destroy]

  def index
    @employees = current_user.employees.all 
  end

  def new
    @employee = current_user.employees.build
  end

  def create
    @employee = current_user.employees.build(post_params)
    @employee.active = params[:employee][:end_date].blank?
    resource_save(@employee, admin_employees_path, new_admin_employee_path)
  end

  def edit
  end

  def update
    @employee.assign_attributes(post_params)
    @employee.active = params[:employee][:end_date].blank?
    resource_save(@employee, admin_employee_path(@employee), edit_admin_employee_path(@employee))
  end

  def destroy
    @employee.destroy
    redirect_to admin_employees_path
  end

  private

  def post_params
    params.require(:employee).permit(
      :name, 
      :start_date, 
      :end_date, 
      :active, 
      :rate, 
      :user_id)
  end

  def set_employee
    @employee = current_user.employees.find_by_id(params[:id])
    redirect_to admin_employees_path unless @employee
  end
end
