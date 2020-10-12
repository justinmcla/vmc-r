class Admin::TasksController < Admin::AdminController
  before_action :set_task, only: [:edit, :update, :destroy]

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(post_params)
    @task.save ? (redirect_to admin_path) : (render :new)
  end

  def edit
  end

  def update
    @task.assign_attributes(post_params)
    @task.save ? (redirect_to admin_path) : (render :edit)
  end

  def destroy
    @task.destroy
    redirect_to admin_path
  end

  private

  def set_task
    @task = current_user.tasks.find_by_id(params[:id])
  end

  def post_params
    params.require(:task).permit(:name, :notes, :user_id)
  end
end
