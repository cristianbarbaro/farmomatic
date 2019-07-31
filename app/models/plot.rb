class Plot < ApplicationRecord
    belongs_to :farm
    has_many :plantations
    has_many :problems
end
