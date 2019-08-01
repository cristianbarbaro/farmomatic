class ProductApplication < ApplicationRecord
  belongs_to :product
  belongs_to :plot
end
