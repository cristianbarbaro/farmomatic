class User < ApplicationRecord
  after_create :assign_default_role

  rolify
  has_many :publications, :class_name => "Novelty"
  has_many :assigments
  has_many :producer_novelties
  has_many :farms, :through => :assigments
  has_many :novelties, :through => :producer_novelties

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Default, user is farmer
  def assign_default_role
    self.add_role(:farmer) if self.roles.blank?
  end
end
