class ProducerNovelty < ApplicationRecord
  belongs_to :user
  belongs_to :novelty

  validates :user_id, :novelty_id, presence: true
end
