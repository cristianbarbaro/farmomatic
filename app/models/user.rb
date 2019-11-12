class User < ApplicationRecord
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
end
