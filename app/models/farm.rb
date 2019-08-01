class Farm < ApplicationRecord
    has_many :plots

    validates :name, :description, presence: true
end
