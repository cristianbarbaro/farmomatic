class Plantation < ApplicationRecord
  belongs_to :plot
  belongs_to :species

  validates :amount, :plot_id, :species_id, presence: true
end
