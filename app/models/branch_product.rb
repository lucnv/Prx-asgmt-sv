class BranchProduct < ApplicationRecord
  belongs_to :branch
  belongs_to :product

  delegate :price, to: :product, prefix: true
end
