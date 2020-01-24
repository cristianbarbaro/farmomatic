class Species < ApplicationRecord
    has_many :plantations, :dependent => :restrict_with_error

    has_many :plots, through: :plantations

    validates :name, presence: true
end
