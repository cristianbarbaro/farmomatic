class User < ApplicationRecord
  rolify
  has_many :assigments
  has_many :farms, :through => :assigments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end