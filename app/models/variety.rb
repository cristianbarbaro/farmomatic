class Variety < ApplicationRecord
    has_many :crops
    has_many :novelties

    validates :name, :scientific_name, presence: true
end
