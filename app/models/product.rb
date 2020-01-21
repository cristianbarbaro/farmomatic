class Product < ApplicationRecord
    has_many :product_applications
    has_many :novelties

    validates :name, :composition, presence: true
end
