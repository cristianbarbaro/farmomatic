class User < ApplicationRecord
  rolify
  has_many :novelties
  has_many :assigments
  has_many :producer_novelties
  has_many :farms, :through => :assigments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
