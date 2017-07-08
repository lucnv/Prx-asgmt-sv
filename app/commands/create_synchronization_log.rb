class CreateSynchronizationLog
  prepend SimpleCommand

  def initialize branch, sync_command
    @branch = branch
    @sync_command = sync_command
  end

  def call
    create_log
  end

  private
  attr_reader :branch, :sync_command

  def create_log
    sync_command.success? ? create_success_log : create_fail_log
  end

  def create_success_log
    statistic_msg = sync_command.result.inject("") do |msg, element|
      msg << "#{element[0]}: #{element[1]}\n"
    end
    content = "Synchronize branch data successfully. This is statistics about synchronized data:\n" << statistic_msg
    branch.synchronization_logs.create status: :success, content: content
  end

  def create_fail_log
    errors_msg = sync_command.errors.inject("") do |msg, element|
      msg << "#{element[0]}: #{element[1].join "; "}\n"
    end
    content = "Fail to synchronize branch data. Reasons:\n" << errors_msg
    branch.synchronization_logs.create status: :failed, content: content
  end
end
