class Plot < ApplicationRecord
    belongs_to :farm
    has_many :plantations
    has_many :problems
    has_many :product_applications
    has_many :crops

    has_many :species, through: :plantations
    
    validates :identifier, :surface, :farm_id, presence: true
end
