class Other < ApplicationRecord
    belongs_to :plantation, optional: true
    belongs_to :problem, optional: true
    belongs_to :product_application, optional: true
    belongs_to :crop, optional: true

    validates :name, :description, presence: true
end
