class Novelty < ApplicationRecord
  belongs_to :user
  has_many :producer_novelties
  has_many :producers, :through => :producer_novelties, :source => :user
  accepts_nested_attributes_for :producer_novelties

  belongs_to :variety
  belongs_to :product
  belongs_to :type_problem

  validates :title, :body, presence: true
end
