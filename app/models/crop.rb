class Crop < ApplicationRecord
  belongs_to :plot
  belongs_to :variety

  validates :amount, :plot_id, :variety_id, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}
end
