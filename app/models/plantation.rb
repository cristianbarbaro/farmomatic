class Plantation < ApplicationRecord
  belongs_to :plot
  belongs_to :species, optional: true
  belongs_to :user
  has_one :other, dependent: :destroy

  accepts_nested_attributes_for :other, allow_destroy: true

  validates :amount, :plot_id, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}

  def remove_blank_other()
    if self.other.name.blank? && self.other.description.blank?
      self.other.delete
    end
  end
end
