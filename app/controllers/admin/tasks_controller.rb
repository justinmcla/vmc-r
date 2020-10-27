class Admin::TasksController < Admin::AdminController
  before_action :set_task, only: [:edit, :update, :destroy]

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(post_params)
    resource_save(@task, admin_path, new_admin_task_path)
  end

  def edit
  end

  def update
    @task.assign_attributes(post_params)
    resource_save(@task, admin_path, edit_admin_task_path(@task))
  end

  def destroy
    @task.destroy
    redirect_to admin_path
  end

  private

  def set_task
    @task = current_user.tasks.find_by_id(params[:id])
    redirect_to admin_path unless @task
  end

  def post_params
    params.require(:task).permit(:name, :notes, :user_id)
  end
end
