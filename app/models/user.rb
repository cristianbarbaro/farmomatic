class User < ApplicationRecord
  after_create :assign_default_role

  rolify
  has_many :publications, :class_name => "Novelty"
  has_many :assigments
  has_many :producer_novelties
  has_many :farms, :through => :assigments
  has_many :novelties, :through => :producer_novelties

  has_many :plots, :through => :farms
  
  has_many :crops, :through => :plots
  has_many :problems, :through => :plots
  has_many :product_applications, :through => :plots

  has_many :type_problems, :through => :problems
  has_many :products, :through => :product_applications
  has_many :varieties, :through => :crops

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Default, user is farmer
  def assign_default_role
    self.add_role(:farmer) if self.roles.blank?
  end
end
