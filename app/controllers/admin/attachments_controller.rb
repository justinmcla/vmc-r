class Admin::AttachmentsController < Admin::AdminController
  before_action :set_attachment

  def destroy
    @attachment.purge
    redirect_to admin_venue_path(@attachment.record)
  end

  private

  def set_attachment
    @attachment = ActiveStorage::Attachment.find(params[:id])
  end
end