class Species < ApplicationRecord
    has_many :plantations

    validates :name, presence: true
end
