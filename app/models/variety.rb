class Variety < ApplicationRecord
    has_many :crops

    validates :name, :scientific_name_id, presence: true
end
