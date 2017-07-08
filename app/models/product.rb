class Product < ApplicationRecord
  include DescriptionTruncate

  belongs_to :category
  has_many :order_details
  has_many :branch_products

  scope :with_total_quantity, -> do
    joins(:branch_products)
    .select("product_id as id, name, category_id, description, price, sum(quantity) as quantity")
    .group(:product_id)
  end

  delegate :name, to: :category, prefix: true, allow_nil: true
end
