class BranchProduct < ApplicationRecord
  belongs_to :branch
  belongs_to :product

  delegate :price, to: :product, prefix: true
  delegate :name, :category_name, :description_truncate, :price, to: :product, prefix: false
end
