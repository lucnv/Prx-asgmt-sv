module DescriptionTruncate
  DEFAULT_TRUNCATE_LENGTH = 80

  def description_truncate length = DEFAULT_TRUNCATE_LENGTH
    description.truncate length if description.present?
  end
end
