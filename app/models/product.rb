class Product < ApplicationRecord
    has_many :product_applications

    validates :name, :composition, presence: true
end
