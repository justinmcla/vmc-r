class Admin::EmployeesController < AdminController
    def index
        @employees = current_user.employees.all 
    end
end
