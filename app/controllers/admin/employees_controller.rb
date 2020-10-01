class Admin::EmployeesController < AdminController
    before_action :set_employee, only: [:edit, :update, :show, :destroy]

    def index
        @employees = current_user.employees.all 
    end
    def new
        @employee = current_user.employees.build
    end
    def create
        @employee = current_user.employees.build(post_params)
        if @employee.save
            redirect_to admin_employees_path
        else
            render :new
        end
    end

    private

    def post_params
        params.require(:employee).permit(:name, :start_date, :end_date, :active, :rate, :user_id)
    end

    def set_employee
        @employee = current_user.employees.find_by_id(params[:id])
    end
end
