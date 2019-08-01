class Problem < ApplicationRecord
  belongs_to :type_problem
  belongs_to :plot

  validates :plot_id, :type_problem_id, presence: true
end
