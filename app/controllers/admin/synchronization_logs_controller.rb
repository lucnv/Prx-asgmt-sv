class Admin::SynchronizationLogsController < Admin::BaseController
  def index
    @synchronization_logs = SynchronizationLog.recent_created.page(params[:page]).per 10
  end
end
