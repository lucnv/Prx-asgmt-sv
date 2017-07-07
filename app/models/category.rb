class Category < ApplicationRecord
  include DescriptionTruncate

  has_many :products
end
