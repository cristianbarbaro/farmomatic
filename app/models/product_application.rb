class ProductApplication < ApplicationRecord
  belongs_to :product
  belongs_to :plot

  validates :amount, :plot_id, :product_id, presence: true
end
