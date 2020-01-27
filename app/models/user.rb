class User < ApplicationRecord
  #after_create :assign_default_role

  rolify
  has_many :publications, :class_name => "Novelty"
  has_many :producer_novelties
  #has_many :farms, through: :roles, source_type: 'Farm', source: :resource
  has_many :novelties, :through => :producer_novelties

  has_many :problems
  has_many :product_applications
  has_many :crops
  has_many :plantations

  has_many :type_problems, :through => :problems
  has_many :products, :through => :product_applications
  has_many :varieties, :through => :crops
  has_many :species, :through => :plantations

#  has_many :plots, :through => :farms
  
#  has_many :crops, :through => :plots
#  has_many :problems, :through => :plots
#  has_many :product_applications, :through => :plots

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Default, user is farmer
  #def assign_default_role
  #  self.add_role(:farmer) if self.roles.blank?
  #end

  # note: returns an unscopable array, unlike a regular association
  #def farms(role_name = nil)
  #  conditions = {:resource_type => "Farm"}
  #  conditions.merge!(:name => role_name) if role_name
  #  self.roles.where(conditions).map(&:resource)
  #end
end
