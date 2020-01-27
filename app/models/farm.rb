class Farm < ApplicationRecord
    resourcify
    has_many :plots, :dependent => :restrict_with_error # raises ActiveRecord::DeleteRestrictionError
    #has_many :users, :through => :assigments, :dependent => :restrict_with_error # raises ActiveRecord::DeleteRestrictionError
    has_many :users, through: :roles, class_name: 'User', source: :users

    validates :name, :description, presence: true
    validates :name, format: { with: /\A[a-zA-Z0-9 ]+\z/ }
end
