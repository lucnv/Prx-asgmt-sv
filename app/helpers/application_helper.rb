module ApplicationHelper
  def index_of counter, page, per_page
    (page - 1) * per_page + counter + 1
  end

  def time_as_format time, format
    l time, format: format
  rescue ArgumentError
    nil
  end
end
