class TypeProblem < ApplicationRecord
    has_many :problems, :dependent => :restrict_with_error
    has_many :novelties, :dependent => :restrict_with_error

    validates :name, :scientific_name, presence: true
end
