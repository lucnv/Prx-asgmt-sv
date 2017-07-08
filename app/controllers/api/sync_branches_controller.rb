class Api::SyncBranchesController < Api::BaseController
  before_action :authenticate!

  def create
    uploaded_file_path = params[:xml_data].try :path
    branch = current_user.branch
    sync_command = SynchronizeBranchXmlData.call branch, uploaded_file_path
    CreateSynchronizationLog.call branch, sync_command if branch.present?
    if sync_command.success?
      render json: {message: "Synchronize branch data successfully", synchronized_data: sync_command.result},
        status: :ok
    else
      render json: {errors: sync_command.errors}, status: :not_acceptable
    end
  end
end
