class Problem < ApplicationRecord
  belongs_to :type_problem, optional: true
  belongs_to :plot
  belongs_to :user
  has_one :other, dependent: :destroy

  accepts_nested_attributes_for :other, allow_destroy: true

  validates :plot_id, presence: true

  def remove_blank_other()
    if self.other.name.blank? && self.other.description.blank?
      self.other.delete
    end
  end
end
