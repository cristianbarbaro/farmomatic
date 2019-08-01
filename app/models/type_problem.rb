class TypeProblem < ApplicationRecord
    has_many :problems

    validates :name, :scientific_name, presence: true
end
