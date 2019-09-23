class Farm < ApplicationRecord
    resourcify
    has_many :plots
    has_many :assigments
    has_many :users, :through => :assigments

    validates :name, :description, presence: true
end
