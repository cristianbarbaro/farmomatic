class Novelty < ApplicationRecord
  belongs_to :user
  has_many :producer_novelties
  #has_many :producers, :through => :producer_novelties, :source => :user
  accepts_nested_attributes_for :producer_novelties

  belongs_to :variety, optional: true
  belongs_to :product, optional: true
  belongs_to :type_problem, optional: true

  validates :title, :body, presence: true
end
