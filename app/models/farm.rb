class Farm < ApplicationRecord
    resourcify
    has_many :plots, :dependent => :restrict_with_error # raises ActiveRecord::DeleteRestrictionError
    has_many :assigments
    has_many :users, :through => :assigments, :dependent => :restrict_with_error # raises ActiveRecord::DeleteRestrictionError

    validates :name, :description, presence: true
    validates :name, format: { with: /\A[a-zA-Z0-9 ]+\z/ }
end
