class Admin::UsersController < Admin::AdminController

  def edit
  end

  def update
    if current_user.update(patch_params)
      redirect_to admin_settings_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def patch_params
      params.require(:user).permit(:name, :email)
  end

end