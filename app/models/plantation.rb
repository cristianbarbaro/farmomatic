class Plantation < ApplicationRecord
  belongs_to :plot
  belongs_to :species
end
