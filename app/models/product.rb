class Product < ApplicationRecord
  include DescriptionTruncate

  belongs_to :category
  has_many :order_details

  delegate :name, to: :category, prefix: true, allow_nil: true
end
