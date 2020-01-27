class Variety < ApplicationRecord
    has_many :crops, :dependent => :restrict_with_error
    has_many :novelties, :dependent => :restrict_with_error

    validates :name, :scientific_name, presence: true
    validates :name, :scientific_name, format: { with: /\A[a-zA-Z ]+\z/ }
end
