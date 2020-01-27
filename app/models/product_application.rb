class ProductApplication < ApplicationRecord
  belongs_to :product
  belongs_to :plot

  validates :amount, :plot_id, :product_id, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}
end
