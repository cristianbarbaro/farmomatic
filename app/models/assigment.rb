class Assigment < ApplicationRecord
  belongs_to :user
  belongs_to :farm

  validates :user_id, :farm_id, presence: true
end
