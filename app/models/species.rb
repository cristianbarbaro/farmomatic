class Species < ApplicationRecord
    has_many :plantations

    has_many :plots, through: :plantations

    validates :name, presence: true
end
