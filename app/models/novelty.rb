class Novelty < ApplicationRecord
  belongs_to :user
  has_many :producer_novelties
  has_many :users, :through => :producer_novelties
end
