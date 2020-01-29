class Plot < ApplicationRecord
    belongs_to :farm
    has_many :plantations, :dependent => :restrict_with_error
    has_many :problems, :dependent => :restrict_with_error
    has_many :product_applications, :dependent => :restrict_with_error
    has_many :crops, :dependent => :restrict_with_error

    has_many :species, through: :plantations
    
    validates :identifier, :surface, :farm_id, presence: true
    validates :greenhouse, inclusion: [true, false]
    validates :surface, numericality: {greater_than_or_equal_to: 0}
    validates :identifier, format: { with: /\A[a-zA-Z0-9 ]+\z/ }
end
