class Crop < ApplicationRecord
  belongs_to :plot
  belongs_to :variety

  validates :amount, :plot_id, :variety_id, presence: true
end
