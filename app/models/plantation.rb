class Plantation < ApplicationRecord
  belongs_to :plot
  belongs_to :species

  validates :amount, :plot_id, :species_id, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}
end
