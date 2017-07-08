class SynchronizationLogsController < BranchDetailsController
  def index
    @synchronization_logs = @branch.synchronization_logs.recent_created.includes(:branch)
      .page(params[:page]).per 10
  end
end
