class Admin::AttachmentsController < Admin::AdminController

  def destroy
    delete_selected(:files) if params[:files]
    delete_selected(:images) if params[:images]
    redirect_back fallback_location: admin_path
  end

  private

  def delete_selected(params_key)
    params[params_key].reject(&:blank?).each do |attached|
      ActiveStorage::Attachment.find(attached).purge
    end
  end

end