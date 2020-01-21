class TypeProblem < ApplicationRecord
    has_many :problems
    has_many :novelties

    validates :name, :scientific_name, presence: true
end
