class TypeProblem < ApplicationRecord
    has_many :problems

    validates :name, :scientific_name_id, presence: true
end
