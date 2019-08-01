class Variety < ApplicationRecord
    has_many :crops

    validates :name, :scientific_name, presence: true
end
