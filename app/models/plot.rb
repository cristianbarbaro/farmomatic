class Plot < ApplicationRecord
    belongs_to :farm
    has_many :plantations, :dependent => :restrict_with_error
    has_many :problems, :dependent => :restrict_with_error
    has_many :product_applications, :dependent => :restrict_with_error
    has_many :crops, :dependent => :restrict_with_error

    has_many :species, through: :plantations
    
    validates :identifier, :surface, :farm_id, presence: true
end
