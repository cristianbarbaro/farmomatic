class Product < ApplicationRecord
    has_many :product_applications, :dependent => :restrict_with_error
    has_many :novelties, :dependent => :restrict_with_error

    validates :name, :composition, presence: true
    validates :name, format: { with: /\A[a-zA-Z ]+\z/ }
end
